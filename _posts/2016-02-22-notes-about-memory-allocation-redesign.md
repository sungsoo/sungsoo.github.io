---
layout: post
title: Notes About Memory Allocation Redesign
date: 2016-02-22
categories: [computer science]
tags: [big data]

---

Notes About Memory Allocation Redesign
======================================

Up through version 7.0, Postgres had serious problems with *memory leakage*
during large queries that process a lot of pass-by-reference data.  There
was no provision for recycling memory until end of query.  This needed to be
fixed, even more so with the advent of TOAST which allows very large chunks
of data to be passed around in the system.  This document describes the new
memory management system implemented in 7.1.


Background
----------

We do most of our memory allocation in "*memory contexts*", which are usually
AllocSets as implemented by src/backend/utils/mmgr/aset.c.  The key to
successful memory management without lots of overhead is to define a useful
set of contexts with appropriate lifespans.

The basic operations on a memory context are:

* create a context

* allocate a chunk of memory within a context (equivalent of standard
  C library's malloc())

* delete a context (including freeing all the memory allocated therein)

* reset a context (free all memory allocated in the context, but not the
  context object itself)

Given a chunk of memory previously allocated from a context, one can
free it or reallocate it larger or smaller (corresponding to standard C
library's free() and realloc() routines).  These operations return memory
to or get more memory from the same context the chunk was originally
allocated in.

At all times there is a "current" context denoted by the
CurrentMemoryContext global variable.  The backend macro palloc()
implicitly allocates space in that context.  The MemoryContextSwitchTo()
operation selects a new current context (and returns the previous context,
so that the caller can restore the previous context before exiting).

The main advantage of memory contexts over plain use of malloc/free is
that the entire contents of a memory context can be freed easily, without
having to request freeing of each individual chunk within it.  This is
both faster and more reliable than per-chunk bookkeeping.  We use this
fact to clean up at transaction end: by resetting all the active contexts
of transaction or shorter lifespan, we can reclaim all transient memory.
Similarly, we can clean up at the end of each query, or after each tuple
is processed during a query.


Some Notes About the palloc API Versus Standard C Library
---------------------------------------------------------

The behavior of palloc and friends is similar to the standard C library's
malloc and friends, but there are some deliberate differences too.  Here
are some notes to clarify the behavior.

* If out of memory, palloc and repalloc exit via elog(ERROR).  They never
return NULL, and it is not necessary or useful to test for such a result.

* palloc(0) is explicitly a valid operation.  It does not return a NULL
pointer, but a valid chunk of which no bytes may be used.  However, the
chunk might later be repalloc'd larger; it can also be pfree'd without
error.  Similarly, repalloc allows realloc'ing to zero size.

* pfree and repalloc do not accept a NULL pointer.  This is intentional.


pfree/repalloc No Longer Depend On CurrentMemoryContext
-------------------------------------------------------

Since Postgres 7.1, pfree() and repalloc() can be applied to any chunk
whether it belongs to CurrentMemoryContext or not --- the chunk's owning
context will be invoked to handle the operation, regardless.  This is a
change from the old requirement that CurrentMemoryContext must be set
to the same context the memory was allocated from before one can use
pfree() or repalloc().

There was some consideration of getting rid of CurrentMemoryContext entirely,
instead requiring the target memory context for allocation to be specified
explicitly.  But we decided that would be too much notational overhead ---
we'd have to pass an appropriate memory context to called routines in
many places.  For example, the copyObject routines would need to be passed
a context, as would function execution routines that return a
pass-by-reference datatype.  And what of routines that temporarily
allocate space internally, but don't return it to their caller?  We
certainly don't want to clutter every call in the system with "here is
a context to use for any temporary memory allocation you might want to
do".  So there'd still need to be a global variable specifying a suitable
temporary-allocation context.  That might as well be CurrentMemoryContext.

The upshot of that reasoning, though, is that CurrentMemoryContext should
generally point at a short-lifespan context if at all possible.  During
query execution it usually points to a context that gets reset after each
tuple.  Only in *very* circumscribed code should it ever point at a
context having greater than transaction lifespan, since doing so risks
permanent memory leaks.


Additions to the Memory-Context Mechanism
-----------------------------------------

Before 7.1 memory contexts were all independent, but it was too hard to
keep track of them; with lots of contexts there needs to be explicit
mechanism for that.

We solved this by creating a tree of "parent" and "child" contexts.  When
creating a memory context, the new context can be specified to be a child
of some existing context.  A context can have many children, but only one
parent.  In this way the contexts form a forest (not necessarily a single
tree, since there could be more than one top-level context; although in
current practice there is only one top context, TopMemoryContext).

We then say that resetting or deleting any particular context resets or
deletes all its direct and indirect children as well.  This feature allows
us to manage a lot of contexts without fear that some will be leaked; we
only need to keep track of one top-level context that we are going to
delete at transaction end, and make sure that any shorter-lived contexts
we create are descendants of that context.  Since the tree can have
multiple levels, we can deal easily with nested lifetimes of storage,
such as per-transaction, per-statement, per-scan, per-tuple.  Storage
lifetimes that only partially overlap can be handled by allocating
from different trees of the context forest (there are some examples
in the next section).

Actually, it turns out that resetting a given context should almost
always imply deleting, not just resetting, any child contexts it has.
So MemoryContextReset() means that, and if you really do want a tree of
empty contexts you need to call MemoryContextResetOnly() plus
MemoryContextResetChildren().

For convenience we also provide operations like "reset/delete all children
of a given context, but don't reset or delete that context itself".


Globally Known Contexts
-----------------------

There are a few widely-known contexts that are typically referenced
through global variables.  At any instant the system may contain many
additional contexts, but all other contexts should be direct or indirect
children of one of these contexts to ensure they are not leaked in event
of an error.

*TopMemoryContext* --- this is the actual top level of the context tree;
every other context is a direct or indirect child of this one.  Allocating
here is essentially the same as "malloc", because this context will never
be reset or deleted.  This is for stuff that should live forever, or for
stuff that the controlling module will take care of deleting at the
appropriate time.  An example is fd.c's tables of open files, as well as
the context management nodes for memory contexts themselves.  Avoid
allocating stuff here unless really necessary, and especially avoid
running with CurrentMemoryContext pointing here.

*PostmasterContext* --- this is the postmaster's normal working context.
After a backend is spawned, it can delete PostmasterContext to free its
copy of memory the postmaster was using that it doesn't need.
(Anything that has to be passed from postmaster to backends is passed
in TopMemoryContext.  The postmaster has only TopMemoryContext,
PostmasterContext, and ErrorContext --- the remaining top-level contexts
are set up in each backend during startup.)

*CacheMemoryContext* --- permanent storage for relcache, catcache, and
related modules.  This will never be reset or deleted, either, so it's
not truly necessary to distinguish it from TopMemoryContext.  But it
seems worthwhile to maintain the distinction for debugging purposes.
(Note: CacheMemoryContext has child contexts with shorter lifespans.
For example, a child context is the best place to keep the subsidiary
storage associated with a relcache entry; that way we can free rule
parsetrees and so forth easily, without having to depend on constructing
a reliable version of freeObject().)

*MessageContext* --- this context holds the current command message from the
frontend, as well as any derived storage that need only live as long as
the current message (for example, in simple-Query mode the parse and plan
trees can live here).  This context will be reset, and any children
deleted, at the top of each cycle of the outer loop of PostgresMain.  This
is kept separate from per-transaction and per-portal contexts because a
query string might need to live either a longer or shorter time than any
single transaction or portal.

*TopTransactionContext* --- this holds everything that lives until end of the
top-level transaction.  This context will be reset, and all its children
deleted, at conclusion of each top-level transaction cycle.  In most cases
you don't want to allocate stuff directly here, but in CurTransactionContext;
what does belong here is control information that exists explicitly to manage
status across multiple subtransactions.  Note: this context is NOT cleared
immediately upon error; its contents will survive until the transaction block
is exited by COMMIT/ROLLBACK.

*CurTransactionContext* --- this holds data that has to survive until the end
of the current transaction, and in particular will be needed at top-level
transaction commit.  When we are in a top-level transaction this is the same
as TopTransactionContext, but in subtransactions it points to a child context.
It is important to understand that if a subtransaction aborts, its
CurTransactionContext is thrown away after finishing the abort processing;
but a committed subtransaction's CurTransactionContext is kept until top-level
commit (unless of course one of the intermediate levels of subtransaction
aborts).  This ensures that we do not keep data from a failed subtransaction
longer than necessary.  Because of this behavior, you must be careful to clean
up properly during subtransaction abort --- the subtransaction's state must be
delinked from any pointers or lists kept in upper transactions, or you will
have dangling pointers leading to a crash at top-level commit.  An example of
data kept here is pending NOTIFY messages, which are sent at top-level commit,
but only if the generating subtransaction did not abort.

*PortalContext* --- this is not actually a separate context, but a
global variable pointing to the per-portal context of the currently active
execution portal.  This can be used if it's necessary to allocate storage
that will live just as long as the execution of the current portal requires.

*ErrorContext* --- this permanent context is switched into for error
recovery processing, and then reset on completion of recovery.  We arrange
to have a few KB of memory available in it at all times.  In this way, we
can ensure that some memory is available for error recovery even if the
backend has run out of memory otherwise.  This allows out-of-memory to be
treated as a normal ERROR condition, not a FATAL error.


Contexts For Prepared Statements And Portals
--------------------------------------------

A prepared-statement object has an associated private context, in which
the parse and plan trees for its query are stored.  Because these trees
are read-only to the executor, the prepared statement can be re-used many
times without further copying of these trees.

An execution-portal object has a private context that is referenced by
PortalContext when the portal is active.  In the case of a portal created
by DECLARE CURSOR, this private context contains the query parse and plan
trees (there being no other object that can hold them).  Portals created
from prepared statements simply reference the prepared statements' trees,
and don't actually need any storage allocated in their private contexts.


Transient Contexts During Execution
-----------------------------------

When creating a prepared statement, the parse and plan trees will be built
in a temporary context that's a child of MessageContext (so that it will
go away automatically upon error).  On success, the finished plan is
copied to the prepared statement's private context, and the temp context
is released; this allows planner temporary space to be recovered before
execution begins.  (In simple-Query mode we don't bother with the extra
copy step, so the planner temp space stays around till end of query.)

The top-level executor routines, as well as most of the "plan node"
execution code, will normally run in a context that is created by
ExecutorStart and destroyed by ExecutorEnd; this context also holds the
"plan state" tree built during ExecutorStart.  Most of the memory
allocated in these routines is intended to live until end of query,
so this is appropriate for those purposes.  The executor's top context
is a child of PortalContext, that is, the per-portal context of the
portal that represents the query's execution.

The main memory-management consideration in the executor is that
expression evaluation --- both for qual testing and for computation of
targetlist entries --- needs to not leak memory.  To do this, each
ExprContext (expression-eval context) created in the executor has a
private memory context associated with it, and we switch into that context
when evaluating expressions in that ExprContext.  The plan node that owns
the ExprContext is responsible for resetting the private context to empty
when it no longer needs the results of expression evaluations.  Typically
the reset is done at the start of each tuple-fetch cycle in the plan node.

Note that this design gives each plan node its own expression-eval memory
context.  This appears necessary to handle nested joins properly, since
an outer plan node might need to retain expression results it has computed
while obtaining the next tuple from an inner node --- but the inner node
might execute many tuple cycles and many expressions before returning a
tuple.  The inner node must be able to reset its own expression context
more often than once per outer tuple cycle.  Fortunately, memory contexts
are cheap enough that giving one to each plan node doesn't seem like a
problem.

A problem with running index accesses and sorts in a query-lifespan context
is that these operations invoke datatype-specific comparison functions,
and if the comparators leak any memory then that memory won't be recovered
till end of query.  The comparator functions all return bool or int32,
so there's no problem with their result data, but there can be a problem
with leakage of internal temporary data.  In particular, comparator
functions that operate on TOAST-able data types need to be careful
not to leak detoasted versions of their inputs.  This is annoying, but
it appeared a lot easier to make the comparators conform than to fix the
index and sort routines, so that's what was done for 7.1.  This remains
the state of affairs in btree and hash indexes, so btree and hash support
functions still need to not leak memory.  Most of the other index AMs
have been modified to run opclass support functions in short-lived
contexts, so that leakage is not a problem; this is necessary in view
of the fact that their support functions tend to be far more complex.

There are some special cases, such as aggregate functions.  nodeAgg.c
needs to remember the results of evaluation of aggregate transition
functions from one tuple cycle to the next, so it can't just discard
all per-tuple state in each cycle.  The easiest way to handle this seems
to be to have two per-tuple contexts in an aggregate node, and to
ping-pong between them, so that at each tuple one is the active allocation
context and the other holds any results allocated by the prior cycle's
transition function.

Executor routines that switch the active CurrentMemoryContext may need
to copy data into their caller's current memory context before returning.
However, we have minimized the need for that, because of the convention
of resetting the per-tuple context at the *start* of an execution cycle
rather than at its end.  With that rule, an execution node can return a
tuple that is palloc'd in its per-tuple context, and the tuple will remain
good until the node is called for another tuple or told to end execution.
This parallels the situation with pass-by-reference values at the table
scan level, since a scan node can return a direct pointer to a tuple in a
disk buffer that is only guaranteed to remain good that long.

A more common reason for copying data is to transfer a result from
per-tuple context to per-query context; for example, a Unique node will
save the last distinct tuple value in its per-query context, requiring a
copy step.


Mechanisms to Allow Multiple Types of Contexts
----------------------------------------------

We may want several different types of memory contexts with different
allocation policies but similar external behavior.  To handle this,
memory allocation functions will be accessed via function pointers,
and we will require all context types to obey the conventions given here.
(As of 2015, there's actually still just one context type; but interest in
creating other types has never gone away entirely, so we retain this API.)

A memory context is represented by an object like

```c
typedef struct MemoryContextData
{
    NodeTag        type;           /* identifies exact kind of context */
    MemoryContextMethods methods;
    MemoryContextData *parent;     /* NULL if no parent (toplevel context) */
    MemoryContextData *firstchild; /* head of linked list of children */
    MemoryContextData *nextchild;  /* next child of same parent */
    char          *name;           /* context name (just for debugging) */
} MemoryContextData, *MemoryContext;
```

This is essentially an abstract superclass, and the "methods" pointer is
its virtual function table.  Specific memory context types will use
derived structs having these fields as their first fields.  All the
contexts of a specific type will have methods pointers that point to the
same static table of function pointers, which look like

```c
typedef struct MemoryContextMethodsData
{
    Pointer     (*alloc) (MemoryContext c, Size size);
    void        (*free_p) (Pointer chunk);
    Pointer     (*realloc) (Pointer chunk, Size newsize);
    void        (*reset) (MemoryContext c);
    void        (*delete) (MemoryContext c);
} MemoryContextMethodsData, *MemoryContextMethods;
```

Alloc, reset, and delete requests will take a MemoryContext pointer
as parameter, so they'll have no trouble finding the method pointer
to call.  Free and realloc are trickier.  To make those work, we
require all memory context types to produce allocated chunks that
are immediately preceded by a standard chunk header, which has the
layout

```c
typedef struct StandardChunkHeader
{
    MemoryContext mycontext;         /* Link to owning context object */
    Size          size;              /* Allocated size of chunk */
};
```

It turns out that the pre-existing aset.c memory context type did this
already, and probably any other kind of context would need to have the
same data available to support realloc, so this is not really creating
any additional overhead.  (Note that if a context type needs more per-
allocated-chunk information than this, it can make an additional
nonstandard header that precedes the standard header.  So we're not
constraining context-type designers very much.)

Given this, the pfree routine looks something like

```c
    StandardChunkHeader * header =
        (StandardChunkHeader *) ((char *) p - sizeof(StandardChunkHeader));

    (*header->mycontext->methods->free_p) (p);
```

More Control Over aset.c Behavior
---------------------------------

Previously, aset.c always allocated an 8K block upon the first allocation
in a context, and doubled that size for each successive block request.
That's good behavior for a context that might hold *lots* of data, and
the overhead wasn't bad when we had only a few contexts in existence.
With dozens if not hundreds of smaller contexts in the system, we need
to be able to fine-tune things a little better.

The creator of a context is now able to specify an initial block size
and a maximum block size.  Selecting smaller values can prevent wastage
of space in contexts that aren't expected to hold very much (an example is
the relcache's per-relation contexts).

Also, it is possible to specify a minimum context size.  If this
value is greater than zero then a block of that size will be grabbed
immediately upon context creation, and cleared but not released during
context resets.  This feature is needed for ErrorContext (see above),
but will most likely not be used for other contexts.

We expect that per-tuple contexts will be reset frequently and typically
will not allocate very much space per tuple cycle.  To make this usage
pattern cheap, the first block allocated in a context is not given
back to malloc() during reset, but just cleared.  This avoids malloc
thrashing.


Memory Context Reset/Delete Callbacks
-------------------------------------

A feature introduced in Postgres 9.5 allows memory contexts to be used
for managing more resources than just plain palloc'd memory.  This is
done by registering a "reset callback function" for a memory context.
Such a function will be called, once, just before the context is next
reset or deleted.  It can be used to give up resources that are in some
sense associated with an object allocated within the context.  Possible
use-cases include

* closing open files associated with a tuplesort object;
* releasing reference counts on long-lived cache objects that are held
  by some object within the context being reset;
* freeing malloc-managed memory associated with some palloc'd object.

That last case would just represent bad programming practice for pure
Postgres code; better to have made all the allocations using palloc,
in the target context or some child context.  However, it could well
come in handy for code that interfaces to non-Postgres libraries.

Any number of reset callbacks can be established for a memory context;
they are called in reverse order of registration.  Also, callbacks
attached to child contexts are called before callbacks attached to
parent contexts, if a tree of contexts is being reset or deleted.

The API for this requires the caller to provide a MemoryContextCallback
memory chunk to hold the state for a callback.  Typically this should be
allocated in the same context it is logically attached to, so that it
will be released automatically after use.  The reason for asking the
caller to provide this memory is that in most usage scenarios, the caller
will be creating some larger struct within the target context, and the
MemoryContextCallback struct can be made "for free" without a separate
palloc() call by including it in this larger struct.