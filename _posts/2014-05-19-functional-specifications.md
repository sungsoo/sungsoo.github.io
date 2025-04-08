---
layout: post
title: Functional Specifications
date: 2014-05-19
categories: [computer science]
tags: [design patterns]

---


## Article Source
* Title: [functional specification](http://searchsoftwarequality.techtarget.com/definition/functional-specification)

[![](http://sungsoo.github.com/images/functional-specifications.png)](http://sungsoo.github.com/images/functional-specifications.png)

# Functional Specifications

A **functional specification** (or sometimes *functional specifications*) is
a formal document used to describe in detail for software developers a
product's intended capabilities, appearance, and interactions with
users. The functional specification is a kind of guideline and
continuing reference point as the developers write the programming code.
(At least one major product development group used a "Write the manual
first" approach. Before the product existed, they wrote the user's guide
for a word processing system, then declared that the user's guide was
the functional specification. The developers were challenged to create a
product that matched what the user's guide described.) Typically, the
functional specification for an application program with a series of
interactive windows and dialogs with a user would show the visual
appearance of the user interface and describe each of the possible user
input actions and the program response actions. A functional
specification may also contain formal descriptions of user tasks,
dependencies on other products, and usability criteria. Many companies
have a guide for developers that describes what topics any product's
functional specification should contain.

For a sense of where the functional specification fits into the
development process, here are a typical series of steps in developing a
software product:

-   **Requirements**. This is a formal statement of what the product
    planners informed by their knowledge of the marketplace and specific
    input from existing or potential customers believe is needed for a
    new product or a new version of an existing product. Requirements
    are usually expressed in terms of narrative statements and in a
    relatively general way.
-   **Objectives**. Objectives are written by product designers in
    response to the Requirements. They describe in a more specific way
    what the product will look like. Objectives may describe
    architectures, protocols, and standards to which the product will
    conform. *Measurable objectives* are those that set some criteria by
    which the end product can be judged. Measurability can be in terms
    of some index of customer satisfaction or in terms of capabilities
    and task times. Objectives must recognize time and resource
    constraints. The development schedule is often part or a corollary
    of the Objectives.
-   **Functional specification**. The functional specification (usually
    *functional spec* or just *spec* for short) is the formal response
    to the objectives. It describes all *external* user and programming
    interfaces that the product must support.
-   **Design change requests**. Throughout the development process, as
    the need for change to the functional specification is recognized, a
    formal change is described in a design change request.
-   **Logic specification**. The structure of the programming (for
    example, major groups of code modules that support a similar
    function), individual code modules and their relationships, and the
    data parameters that they pass to each other may be described in a
    formal document called a logic specification. The logic
    specification describes *internal interfaces* and is for use only by
    the developers, testers, and, later, to some extent, the programmers
    that service the product and provide code fixes to the field.
-   **User documentation**. In general, all of the preceding documents
    (except the logic specification) are used as source material for the
    technical manuals and online information (such as help pages) that
    are prepared for the product's users.
-   **Test plan**. Most development groups have a formal test plan that
    describes test cases that will exercise the programming that is
    written. Testing is done at the module (or unit) level, at the
    component level, and at the system level in context with other
    products. This can be thought of as *alpha testing*. The plan may
    also allow for [beta
    test](http://searchcio-midmarket.techtarget.com/definition/beta-test).
    Some companies provide an early version of the product to a selected
    group of customers for testing in a "real world" situation.
-   **The final product**. Ideally, the final product is a complete
    implementation of the functional specification and design change
    requests, some of which may result from formal testing and beta
    testing.

The cycle is then repeated for the next version of the product,
beginning with a new Requirements statement, which ideally uses feedback
from customers about the current product to determine what customers
need or want next.

Most software makers adhere to a formal development process similar to
the one described above. The hardware development process is similar but
includes some additional considerations for the outsourcing of parts and
verification of the manufacturing process itself.