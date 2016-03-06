---
layout: post
title: Concurrency Control and Recovery for Search Trees
date: 2016-03-07
categories: [computer science]
tags: [data management]

---

# Concurrency Control and Recovery for Search Trees

## Concurrency in B+-Trees

**Challenge:** Develop a concurrency protocol that allows highly concurrent access to a search tree.  (2PL is unacceptable!)

**Solution 1:** Optimistic CC.  Kung and Robinson said we can do optimistic locking on B-trees, since each lookup touches only h pages, and the tree will have fh pages.

* Quibble: Everybody has already implemented locking, since it's a better general-purpose solution (and was invented first)
* More Fundamental Quibble: The h pages are not chosen at random.
* Complaint: Aborts can happen because of structural conflicts, with NO data conflicts!

**Solution 2:** release locks early (non-2PL!)  "Latches".

* Latches vs. Locks:
	- Latches, like mutexes, are on physical memory addresses (in bufPool).  Cheap to allocate and set.  Locks are on externally visible data, and named in a lock table that has a lot of data structure support (hash at least by lockname and by xact).  So expensive to allocated and set (10x latches).
	- Latches, like mutexes, are held "as long as needed". Locks are held to transaction boundaries.
	
**Solution 2.1:** Extra latch modes + "Safety analysis" (Bayer/Schkolnick) 

**Solution 2.2:** Page latches, Rightlinks and compensating traversal (Lehman/Yao) 

**Solution 2.3:** Latch coupling during traversal. "Repositioning" logic ocassionally required. (ARIES/IM) 
 
## B-Link Trees (Lehman/Yao)

A super-high concurrency solution, at the expense of a little extra complexity in the data structure.

* take a B+-tree (they call it a B*-tree)
* add "high keys" to each page
* add right-links to each page (Idea: think of two nodes with a right-link as one big node)
* ensure that people search top-down, left-to-right
* ensure that people insert bottom-up
* Requires NO locking for read (!!)
* "Lock coupling" for writes is rare (question: why is lock coupling so bad?)

### Search

```c
current = root;
A = get(current);
while (current is not a leaf) {
        current = scannode1(v, A);
        A = get(current);
}
while ((t = scannode(v,A)) == link pointer of A) {
        current = t;
        A = get(current);
}
if (v is in A)
        return(success);
else return(failure);
```

Simple! Only trick is to have scannode know about high-keys and right-links.

(Footnote: The scannode(v,A) routine examines memorypage A and finds the appropriate pointer for value v .  Note that itmay return a right-link pointer instead of a child pointer.)

### Insert

First, we find a leaf node, and keep a stack of the rightmost node we visited at eachlevel:

```c
initialize stack;
current = root;
A = get(current);
while (current is not a leaf) {
        t = current;
        current = scannode(v,A);
        if (current not link pointer in A)
                push t;
        A = get(current);
}
```
When we get to the leaf level, we may need to search right for the appropriate leaf.  The move_right procedure scans right across the bottom, with lock coupling (i.e.if you have to move right, first lock right neighbor, then release lock on current).

```c
lock(current);
A = get(current);
move_right();
```

Now, assuming the key/ptr pair is not already in the tree, we proceed to insert &possibly split:

**Doinsertion:**

```c
if A is safe {
        insert new key/ptr pair on A;
        put(A, current);
        unlock(current);
}
else { // gonna have to split
        u = allocate(1 new page for B);
        redistribute A over A and B;
        y = max value on A now;
        make high key of B equal old high key of A;
        make right-link of B equal old right-link of A;
        make high key of A equal y;
        make right-link of A point to B;
        put (B, u);
        put (A, current);
        oldnode = current;
        new key/ptr pair = (y, u); // high key of new page, new page
        current = pop(stack);
        lock(current);
        A = get(current);
        move_right(); // at this point we may have 3 locks: oldnode,
                      // and two at the parent level while moving right
        unlock(oldnode);
        goto Doinsertion;
}
```

Note the worst-case multiple locking here. (Improvement later proposed by Sagiv, and byLanin & Shasha: unlock current after put(A, current) ).

### Delete:

Just remove from the leaf. They punt on underflow -- just let leaves get empty, never delete them (hence never do deletion from internal nodes.) If you think your tree is too empty, then reorganize it offline.   In practice, people don't deal with underflow in real systems, but do reclaim empty pages periodically.

Why does this all work?

1. Deadlock-free: there is a total order on tree nodes (bottom-up, left-to-right) that is followed by locking protocol
2. Correctness of Tree Modifications: By doing put(B, u) before put(A, current) in insert, we make node splitting atomic at each level. This means at any time the tree will appear consistent (though it may have "big" nodes)
3. Correct Interaction: it is somewhat tricky to show that reader/writer and writer/writer pairs don&rsquo;t step on each other. The worrisome case is when a reader reads node N, which is subsequently updated by a writer. In this case, the reader will subsequently detect relevant inserts by seeing (possibly lower in the tree) that she needs to keep looking right.

Alternative techniques are used in ARIES: ARIES/KVL & ARIES/IM. Don;t require right-links.  Instead, do lock-coupling during traversal. On occasion need to"reposition" (i.e. find the appropriate spot on a level to continue.) Papers handle lots more details than Lehman/Yao, including degree-3 consistency, deletion, logging/recovery, savepoints. 
 

## Degree-3 Consistency in B+-Trees

The Phantom Problem:  Assume you do correct tree concurrency and 2PL of data records.  Suppose you start a transaction that queries an index for <name = "Dennis the Menace">, and the result is empty.  Now suppose another transaction inserts a person with name Dennis the Menace, and you re-run your query.  Now you'll see a Phantom Menace!
Problem: 2PL locks the data, but not the "holes" in the data domain that overlap the query.

**Solutions:**

Predicate locking.  Expensive to compare predicates (requires sequentially comparing query against all locks).  Very accurate, but not gradually expanding -- consider the case of a "top n" query like you get on web forms.
Next-Key Locking: queries and inserts try to lock the record in the DB that contains the next-higher value.  A physical surrogate for a logical range.  Cheap to check (hash lookup), can be inaccurate.  Expands gradually on range search.  This is what everybody does for B-trees.

## Concurrency Control in GiSTs (and R-trees, etc.)

A CS286 class project in ’94, published VLDB ’95 (Kornacker & Banks). Improved for GiST with concurrency, degree-3 consistency, deletion, savepoints in SIGMOD ’97 (Kornacker, Mohan & Hellerstein).

Main differences to focus on:

* search traverses multiple nodes
* can't count on data domain being linearly ordered

Raises 3 questions:

1. how do we detect a node has split?
	- this can’t be done using data values in an R-tree
2. how do we limit extent to which we move right?
	- no way to know we’ve caught up with inserters
3. how can we find a physical surrogate for phantom protection?

Idea for first 2 questions: impose an ordering that has nothing to do with the data.

Each page gets a Node Sequence Number (NSN), like a timestamp.  On page split, the new right sibling gets the original NSN, and the left sibling gets a new NSN, and parent’s NSN is updated on insertion of pointer to new sibling.

Split detection: Traversal remembers the global NSN when remembering a child pointer.  If upon arrival at the child, the child’s NSN is greater than the global NSN remembered while in the parent entry, child has since split.

Limiting right-traversal: only scan until a lower NSN.

### Phantom Protection in GiST:

* 2PL the data records.
* Can't use "next-key" locking for the holes: no obvious next key!
* OK, resort to predicate locks.  But would like to avoid scanning predicate locks.  Could build a main-memory GiST on predicate locks?
* But wait -- we have a GiST on the data handy already.  "Attach" query predicates to all nodes searched.  Inserters check predicate locks attached to leaves that they visit.
* Even simpler: overlock.  Put "True" on all leaves you touch. GiST nodes become your physical surrogates!
* This gives cheap check, fairly gradual expansion (node at a time), and as much accuracy as you care to implement.

Paper also shows that ARIES-IM doesn't apply to GiST.  If a sibling splits, need to "reposition" in the parent.  Requires you to understand what siblings you've already seen based on keys, which implies that keys must partition the data domain (or you can't tell what you've already seen!)

## GiST (and B-link Tree) Recovery

Goals of recovery:

* Restore tree structure to working condition (i.e. it finds the data)
* Restore tree contents to transactionally consistent state.

Note that the former goal is not a transactional statement!  Leads to two main tricks:

* physical logging of SMOs (structure modification operations).  SMOs are committed immediately as "nested top actions", independent of transaction success or failure.  Must lock what you log (else unrecoverable physical operations!), so latches held during split until CLR of the nested top action is generated.
* logical UNDO logging of data contents of tree.  During undo, find the page, perform compensating action.

A detail:

* During recovery, the latches that were set at crash time are lost.  Structure mods may be in flight (orphaned babies, unpropagated keys, etc.)  So cannot retraverse to find data.
* In GiST and other link trees, can use rightlinks to find data.
* In ARIES-IM, they need a tree-global lock during split to avoid these kinds of issues!

Note: There's nothing here that has anything to do with the data -- it's all extensible.  The contribution of the paper here is to figure out recovery for B-link and GiST, which actually improves upon ARIES/IM.

## Lessons

### CC&R:

* Transactional consistency only required for transactionally visible data.  So separate physical structure from transactional content.  Can play games with locking and logging for structure.

### Extensibility

* Tree traversal is a structural algorithm -- it's just guided by content-specific keys.  Can use structural information to follow movement of items in the tree (NSNs).
* Tree structure provides a "physio-logical" hierarchy that can be exploited for CC&R in a domain-independent (hence extensible) way.  The hierarchy gives a rough (superset) correspondence of physical pages to logical subregions that are traversed by queries -- can be used for phantom protection instead of next-key locking (another rough physical-to-logical mapping.)
