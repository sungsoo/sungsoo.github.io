---
layout: post
title: The Merits of Data Compression 
date: 2016-02-03
categories: [computer science]
tags: [data management]

---


# The Merits of Data Compression

One might think that with storage so cheap, there is little advantage to compressing data. However, storing data in fewer disk blocks enables us to *read and write the data faster*, since we use fewer disk I/O’s. When we need to read entire columns, then storage by *compressed columns* can result in *significant speedups*. However, if we want to read or write only a single tuple, then column-based storage can lose. The reason is that in order to decompress and find the value for the one tuple we want, we need to read the entire column. In contrast, tuple-based storage allows us to read only the block containing the tuple. An even more extreme case is when the data is not only compressed, but encrypted.

In order to make access of single values efficient, we must both com­ press and encrypt on a *block-by-block basis*. The most efficient compres­sion methods generally perform better when they are allowed to compress large amounts of data as a group, and they do not lend themselves to block-based decompression. However, in special cases such as the com­ pression of a The Merits of Data Compression column, we can in fact do *block-by-block compression* that is as good as possible.
