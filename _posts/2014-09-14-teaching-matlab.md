---
layout: post
title: "Teaching MATLAB in 3 hours"
---

I had the opportunity to introduce MATLAB to two groups
of graduate students fitting the following profile:

1. Non-majors in Computer Science

2. Novice MATLAB programmers

3. Programming experience in _some_ language (C/Java)

Learners came in 
with a broad range of expectations:

* What is MATLAB, and what are people doing with it?,
* How to do _X_ with MATLAB?, 
* How can I use MATLAB more effectively than I already am?

# What to teach?

I'm a huge fan of [Software Carpentry](http://software-carpentry.org/),
and their _evidence-based_ 
approach to teaching. The
argument makes sense: we're scientists, and founding our (teaching)
methods on hard research---or at least, _some_ data---is likely a
better idea than using arbitrary lesson plans and teaching techniques.

Accordingly, as a starting point, I chose the Software Carpentry 
<a href="http://software-carpentry.org/v5/novice/python/index.html" target="_blank">
lesson material on Python </a>
These lessons have the immense value of _feedback_ from several
workshops that have been run by trained instructors all over the world.
Of course, the first step would have had to be _translating_ all that lesson
material from Python to MATLAB. 
Which <a href="https://github.com/ashwinsrnth/bc/tree/master/novice/matlab", target="_blank">
I did </a>. This
doubled up as my very first contribution to the open-source community (yay).

The concepts covered are in this order:

* Loading, analyzing and visualizing data from a file
* Writing MATLAB scripts and loops to analyze several data sets in a single keystroke
* How and why to write MATLAB functions
* Conditionals in MATLAB
* Writing tests for functions

# Motivation

I've done sessions on MATLAB before, and I used to follow a "textbook" 
approach: exposing ideas in the same order that they would appear in
a textbook on MATLAB, for example:

* Variables and Statements
* Vectors
* Plots
* Matrices
* Loops
* Conditionals
* Scripts
* Functions

So, in an earlier session, the first few commands that learners would type in
to the shell would be something like this:

```
> a = 1;
> b = 2;
> a + b
> a * b
> c = [a, b]

```

Compare _that_ to the first couple of lines of code that they typed in this time:

```
> patient_data = csvread(`inflammation-01.csv`);
> imagesc(patient_data)

``` 
I think that exposing this sort of powerful functionality earlier is important,
and makes learners feel like "this might actually be worth my time". 

# Demo v/s Live Coding

Getting novice programmers to follow along command-by-command is slow.
The most common mistakes I've seen learners make in workshops:

* Typos
* Calling scripts/functions from the wrong directory

It's tempting then, to demo-ize the whole thing and keep the participants from 
writing too much code. Of course, that's a bad idea and I followed an
approach that was somewhere in-between:

**Commands**

Have learners type out commands on the shell while introducing ideas
for the first time and _demonstrate_ commands when expanding on them
or explaining nuances.

**Scripts/functions**

Have learners type out stripped-down, simple versions of more complex
scripts. For example, instead of having
learners write a script that loops
over several datasets, performs analyses, and plots various figures for 
each, have them type out and execute a script that performs a single analysis
on a single dataset, and produces a single figure. _Then_ ask them to 
look at a more complex version of that script that was distributed to them
at the beginning of the session.

# Etherpad

I also experimented with a workshop etherpad, and gave learners the option
of taking notes there instead of on their personal notepads/computers. 
Most learners preferred not to interact too much with the etherpad,
I'm not sure why - maybe this should be part of the feedbacK - but here
are some possible reasons:

* Not enough time
* Not familiar with etherpad
* Not as convenient/useful as personal notes

# Feedback

# Did it work?
