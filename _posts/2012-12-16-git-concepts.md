---
layout: post
title: Git Concepts and Architecture
date: 2013-12-10
categories: [information technology]
tags: [developments, source code control]

---
### The Three Trees Architecture

In this article, we're going to examine a few key concepts in Git that will help you to better understand how it works, and the first of these is the three tree architecture that it uses.

#### Two-tree architecture
Let's begin by looking at a typical two-tree architecture.
This is what a lot of other version control systems use.
We have a repository and a working copy, and those are our two trees.

Now we call them trees because they represent a file structure.
All right, our working copy begins with the top of our project directory and below of that might be four or five different folders that have a few files in them, maybe a few more folders, each of those folders has a few more folders in it, and you can imagine that if you map that out, that each of those folders would then branch out like the branches of a tree.

It's really a directory tree whose trunk begins with the root of our project.

Now the repository also has a set of files in it.

15
00:00:49,000 --> 00:00:52,990
And when we want to move files between the repository or the working copy, we

16
00:00:53,000 --> 00:00:56,990
check out copies--that's the term that we use--we check it out from the

17
00:00:57,000 --> 00:00:59,990
repository into our working directory, and when we finish making our changes we

18
00:01:00,000 --> 00:01:02,990
commit those changes back to the repository.

19
00:01:03,000 --> 00:01:06,990
Now the reason why there are two distinct trees is that these files don't have

20
00:01:07,000 --> 00:01:08,990
to be the same between them.

21
00:01:09,000 --> 00:01:13,990
If I check out copy from the repository, I make some changes into it, I save

22
00:01:14,000 --> 00:01:15,990
those changes on my hard drive.

23
00:01:16,000 --> 00:01:19,990
Now those changes are saved, they are permanent, they are saved in my working

24
00:01:20,000 --> 00:01:22,990
copy, but they're not yet committed to the repository.

25
00:01:23,000 --> 00:01:25,990
So my working copy looks different from the repository.

26
00:01:26,000 --> 00:01:29,990
Both are saved, it's not like I haven't saved the files, I've done that.

27
00:01:30,000 --> 00:01:33,990
They just aren't saved and tracked in the version control repository.

28
00:01:34,000 --> 00:01:37,990
Now if the repository is a shared repository, and there are many people working

29
00:01:38,000 --> 00:01:40,990
from it, they may commit their changes to the repository.

30
00:01:41,000 --> 00:01:45,990
And if I haven't checked out a copy recently to get those changes, then my

31
00:01:46,000 --> 00:01:47,990
working copy doesn't have their changes.

32
00:01:48,000 --> 00:01:51,990
So once again the repository and the working trees will not have the same

33
00:01:52,000 --> 00:01:52,990
information in them.

34
00:01:53,000 --> 00:01:57,990
So that's a typical two-tree architecture. Git however uses a three-tree architecture.

35
00:01:58,000 --> 00:02:02,990
It still has the repository and the working copies, but in between is another

36
00:02:03,000 --> 00:02:04,990
tree which is the staging index.

37
00:02:05,000 --> 00:02:08,990
Remember when we did our first commit in the last chapter, we didn't just do a

38
00:02:09,000 --> 00:02:11,990
commit, we did an add first.

39
00:02:12,000 --> 00:02:15,990
We added, then we committed, it was a two-step process.

40
00:02:16,000 --> 00:02:20,990
That add, added our files to the staging index, and then from there we

41
00:02:21,000 --> 00:02:22,990
committed to the repository.

42
00:02:23,000 --> 00:02:25,990
Now it is possible to go ahead and just commit directly to the repository and

43
00:02:26,000 --> 00:02:28,990
skip that staging step. We'll learn how to do that later.

44
00:02:29,000 --> 00:02:31,990
But it's important that you understand that this is part of the architecture of

45
00:02:32,000 --> 00:02:33,990
Git, and it's a really nice feature.

46
00:02:34,000 --> 00:02:37,990
Because then what it means is that we can make changes to ten different files

47
00:02:38,000 --> 00:02:38,990
in our working copy.

48
00:02:39,000 --> 00:02:43,990
And then we can say, all right, I am ready to make a commit, but I don't want to

49
00:02:44,000 --> 00:02:47,990
commit all ten of those, I just want to commit five of these as one changed set.

50
00:02:48,000 --> 00:02:52,990
So what I am going to do is I am going to put those on the staging index, add

51
00:02:53,000 --> 00:02:57,990
them to the staging index, get those five files ready to go, and as soon as I am

52
00:02:58,000 --> 00:03:00,990
satisfied that they are ready, now I will commit those five files in one changed

53
00:03:01,000 --> 00:03:02,990
set to the repository.

54
00:03:03,000 --> 00:03:06,990
The other five files are still saved in my working tree, but they never got

55
00:03:07,000 --> 00:03:08,990
added to the staging index or to the repository.

56
00:03:09,000 --> 00:03:12,990
They are sitting there waiting for me to make another commit, to stage those

57
00:03:13,000 --> 00:03:14,990
changes and then commit them to the repository.

58
00:03:15,000 --> 00:03:18,990
And of course we can pull things out of the repository in the same way.

59
00:03:19,000 --> 00:03:22,990
It's possible to pull them from the repository to the staging index, from the

60
00:03:23,000 --> 00:03:25,990
staging index to the working directory, usually that's not what we do.

61
00:03:26,000 --> 00:03:28,990
Usually we go ahead and pull them straight from the repository down to

62
00:03:29,000 --> 00:03:29,990
the working directory.

63
00:03:30,000 --> 00:03:31,990
And in the process the staging index will be updated too.

64
00:03:32,000 --> 00:03:35,990
We have our working copy, where we have our changes that we've made, and we've

65
00:03:36,000 --> 00:03:39,990
saved, and saved to our hard drive, but we have not yet committed them to the

66
00:03:40,000 --> 00:03:42,990
repository, we haven't told Git to make this a changed set and to track it.

67
00:03:43,000 --> 00:03:46,990
Then we have the staging index, which is where we prepare things, we stage them

68
00:03:47,000 --> 00:03:50,990
for the commit, and then after they've been staged, we commit them to the

69
00:03:51,000 --> 00:03:54,990
repository so that they are permanently tracked and they now have a commit

70
00:03:55,000 --> 00:03:56,990
message attached to them.

71
00:03:57,000 --> 00:04:07,000