---
layout: post
title: Google's R Style Guide
date: 2015-09-25
categories: [computer science]
tags: [big data]

---


# Article Source
* Title: [Google's R Style Guide](https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml)

---

Google's R Style Guide
======================

R is a high-level programming language used primarily for statistical
computing and graphics. The goal of the R Programming Style Guide is to
make our R code easier to read, share, and verify. The rules below were
designed in collaboration with the entire R user community at Google.

Summary: R Style Rules
----------------------

1.  [File Names](#filenames): end in `.R`
2.  [Identifiers](#identifiers): `variable.name` (or `variableName`),
    `FunctionName`, `kConstantName`
3.  [Line Length](#linelength): maximum 80 characters
4.  [Indentation](#indentation): two spaces, no tabs
5.  [Spacing](#spacing)
6.  [Curly Braces](#curlybraces): first on same line, last on own line
7.  [else](#else): Surround else with braces
8.  [Assignment](#assignment): use `<-`, not `=`
9.  [Semicolons](#semicolons): don't use them
10. [General Layout and Ordering](#generallayout)
11. [Commenting Guidelines](#comments): all comments begin with `#`
    followed by a space; inline comments need two spaces before the `#`
12. [Function Definitions and Calls](#functiondefinition)
13. [Function Documentation](#functiondocumentation)
14. [Example Function](#examplefunction)
15. [TODO Style](#todo): `TODO(username)`

Summary: R Language Rules
-------------------------

1.  [`attach`](#attach): avoid using it
2.  [Functions](#functionlanguage): errors should be raised using
    `stop()`
3.  [Objects and Methods](#object): avoid S4 objects and methods when
    possible; never mix S3 and S4

## Notation and Naming

### File Names 

File names should end in `.R` and, of course, be meaningful. 
 GOOD: `predict_ad_revenue.R` 
 BAD: `foo.R`

### Identifiers

Don't use underscores ( `_` ) or hyphens ( `-` ) in identifiers.
Identifiers should be named according to the following conventions. The
preferred form for variable names is all lower case letters and words
separated with dots (`variable.name`), but `variableName` is also
accepted; function names have initial capital letters and no dots
(`FunctionName`); constants are named like functions but with an initial
`k`.

-   `variable.name` is preferred, `variableName` is accepted 
     GOOD: `avg.clicks` 
     OK: `avgClicks` 
     BAD: `avg_Clicks`
-   `FunctionName ` 
     GOOD: `CalculateAvgClicks` 
     BAD: `calculate_avg_clicks                 `, `calculateAvgClicks`
    
     Make function names verbs. 
    *Exception: When creating a classed object, the function name
    (constructor) and class should match (e.g., lm).*
-   `kConstantName `

## Syntax

### Line Length 

The maximum line length is 80 characters.

### Indentation

When indenting your code, use two spaces. Never use tabs or mix tabs and
spaces. 
*Exception: When a line break occurs inside parentheses, align the
wrapped line with the first character inside the parenthesis.*

### Spacing

Place spaces around all binary operators (`=`, `+`, `-`, `<-`, etc.). 
*Exception: Spaces around `=`'s are optional when passing parameters in
a function call.*

Do not place a space before a comma, but always place one after a comma.


GOOD:
```r
    tab.prior <- table(df[df$days.from.opt < 0, "campaign.id"])
    total <- sum(x[, 1])
    total <- sum(x[1, ])
```
BAD:
```r
    tab.prior <- table(df[df$days.from.opt<0, "campaign.id"])  # Needs spaces around '<'
    tab.prior <- table(df[df$days.from.opt < 0,"campaign.id"])  # Needs a space after the comma
    tab.prior<- table(df[df$days.from.opt < 0, "campaign.id"])  # Needs a space before <-
    tab.prior<-table(df[df$days.from.opt < 0, "campaign.id"])  # Needs spaces around <-
    total <- sum(x[,1])  # Needs a space after the comma
    total <- sum(x[ ,1])  # Needs a space after the comma, not before
```
Place a space before left parenthesis, except in a function call.

GOOD: 

```r
if (debug)
```

BAD:
 
```r
if(debug)
```
Extra spacing (i.e., more than one space in a row) is okay if it
improves alignment of equals signs or arrows (`<-`).

```r
    plot(x    = x.coord,
         y    = data.mat[, MakeColName(metric, ptiles[1], "roiOpt")],
         ylim = ylim,
         xlab = "dates",
         ylab = metric,
         main = (paste(metric, " for 3 samples ", sep = "")))
```

Do not place spaces around code in parentheses or square brackets. 
*Exception: Always place a space after a comma.*

GOOD:

```r
    if (debug)
    x[1, ]
```

BAD:

```r
    if ( debug )  # No spaces around debug
    x[1,]  # Needs a space after the comma 
```

### Curly Braces 

An opening curly brace should never go on its own line; a closing curly
brace should always go on its own line. You may omit curly braces when a
block consists of a single statement; however, you must *consistently*
either use or not use curly braces for single statement blocks.

```r
    if (is.null(ylim)) {
      ylim <- c(0, 0.06)
    }
```

xor (but not both)

```r
    if (is.null(ylim))
      ylim <- c(0, 0.06)
```

Always begin the body of a block on a new line.

BAD: 
```r
 if (is.null(ylim))               ylim <- c(0, 0.06) 
 if (is.null(ylim))               {ylim <- c(0, 0.06)}
```

### Surround else with braces 

An `else` statement should always be surrounded on the same line by
curly braces.
```r
    if (condition) {
      one or more lines
    } else {
      one or more lines
    }
```

BAD:

```r 
if (condition) {
  one or more lines
}
else {
  one or more lines
}
```

BAD:

```r
if (condition)
  one line
else
  one line
```

### Assignment

Use `<-`, not `=`, for assignment.

GOOD: 
` x <- 5 `

BAD: 
` x = 5`

### Semicolons

Do not terminate your lines with semicolons or use semicolons to put
more than one command on the same line. (Semicolons are not necessary,
and are omitted for consistency with other Google style guides.)

## Organization

### General Layout and Ordering 

If everyone uses the same general ordering, we'll be able to read and
understand each other's scripts faster and more easily.

1.  Copyright statement comment
2.  Author comment
3.  File description comment, including purpose of program, inputs, and
    outputs
4.  `source()` and `library()` statements
5.  Function definitions
6.  Executed statements, if applicable (e.g., ` print`, `plot`)

Unit tests should go in a separate file named `originalfilename_test.R`.

### Commenting Guidelines 

Comment your code. Entire commented lines should begin with `#` and one
space.

Short comments can be placed after code preceded by two spaces, `#`, and
then one space.

```r
    # Create histogram of frequency of campaigns by pct budget spent.
    hist(df$pct.spent,
         breaks = "scott",  # method for choosing number of buckets
         main   = "Histogram: fraction budget spent by campaignid",
         xlab   = "Fraction of budget spent",
         ylab   = "Frequency (count of campaignids)")
```

### Function Definitions and Calls 

Function definitions should first list arguments without default values,
followed by those with default values.

In both function definitions and function calls, multiple arguments per
line are allowed; line breaks are only allowed between assignments. 
GOOD:

```r
    PredictCTR <- function(query, property, num.days,
                           show.plot = TRUE)
```

BAD:

```r
    PredictCTR <- function(query, property, num.days, show.plot =
                           TRUE)
```

Ideally, unit tests should serve as sample function calls (for shared
library routines).

### Function Documentation 

Functions should contain a comments section immediately below the
function definition line. These comments should consist of a
one-sentence description of the function; a list of the function's
arguments, denoted by `Args:`, with a description of each (including the
data type); and a description of the return value, denoted by
`Returns:`. The comments should be descriptive enough that a caller can
use the function without reading any of the function's code.

### Example Function 

```r
    CalculateSampleCovariance <- function(x, y, verbose = TRUE) {
      # Computes the sample covariance between two vectors.
      #
      # Args:
      #   x: One of two vectors whose sample covariance is to be calculated.
      #   y: The other vector. x and y must have the same length, greater than one,
      #      with no missing values.
      #   verbose: If TRUE, prints sample covariance; if not, not. Default is TRUE.
      #
      # Returns:
      #   The sample covariance between x and y.
      n <- length(x)
      # Error handling
      if (n <= 1 || n != length(y)) {
        stop("Arguments x and y have different lengths: ",
             length(x), " and ", length(y), ".")
      }
      if (TRUE %in% is.na(x) || TRUE %in% is.na(y)) {
        stop(" Arguments x and y must not have missing values.")
      }
      covariance <- var(x, y)
      if (verbose)
        cat("Covariance = ", round(covariance, 4), ".n", sep = "")
      return(covariance)
    }
```
### TODO Style

Use a consistent style for TODOs throughout your code. 
`TODO(username): Explicit description of action to be taken`

## Language

### Attach

The possibilities for creating errors when using `attach` are numerous.
Avoid it.

### Functions 

Errors should be raised using `stop()`.

### Objects and Methods 

The S language has two object systems, S3 and S4, both of which are
available in R. S3 methods are more interactive and flexible, whereas S4
methods are more formal and rigorous. (For an illustration of the two
systems, see Thomas Lumley's "Programmer's Niche: A Simple Class, in S3
and S4" in R News 4/1, 2004, pgs. 33 - 36:
[http://cran.r-project.org/doc/Rnews/Rnews_2004-1.pdf](http://cran.r-project.org/doc/Rnews/Rnews_2004-1.pdf).)

Use S3 objects and methods unless there is a strong reason to use S4
objects or methods. A primary justification for an S4 object would be to
use objects directly in C++ code. A primary justification for an S4
generic/method would be to dispatch on two arguments.

Avoid mixing S3 and S4: S4 methods ignore S3 inheritance and vice-versa.

## Exceptions

The coding conventions described above should be followed, unless there
is good reason to do otherwise. Exceptions include legacy code and
modifying third-party code.

## Parting Words

Use common sense and BE CONSISTENT.

If you are editing code, take a few minutes to look at the code around
you and determine its style. If others use spaces around their `if `
clauses, you should, too. If their comments have little boxes of stars
around them, make your comments have little boxes of stars around them,
too.

The point of having style guidelines is to have a common vocabulary of
coding so people can concentrate on *what* you are saying, rather than
on *how* you are saying it. We present global style rules here so people
know the vocabulary. But local style is also important. If code you add
to a file looks drastically different from the existing code around it,
the discontinuity will throw readers out of their rhythm when they go to
read it. Try to avoid this.

OK, enough writing about writing code; the code itself is much more
interesting. Have fun!

## References

[http://www.maths.lth.se/help/R/RCC/](http://www.maths.lth.se/help/R/RCC/)
- R Coding Conventions

[http://ess.r-project.org/](http://ess.r-project.org/) - For emacs
users. This runs R in your emacs and has an emacs mode.
