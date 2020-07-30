## Clojure from the ground up

### Welcome

This guide aims to introduce newcomers and experienced programmers alike to the
beauty of functional programming, starting with the simplest building blocks of
software. You’ll need a computer, basic proficiency in the command line, a text
editor, and an internet connection. By the end of this series, you’ll have a
thorough command of the Clojure programming language.

#### Who is this guide for?

Science, technology, engineering, and mathematics are deeply rewarding fields,
yet few women enter STEM as a career path. Still more are discouraged by a
culture which repeatedly asserts that women lack the analytic aptitude for
writing software, that they are not driven enough to be successful scientists,
that it’s not cool to pursue a passion for structural engineering. Those few
with the talent, encouragement, and persistence to break in to science and tech
are discouraged by persistent sexism in practice: the old boy’s club of tenure,
being passed over for promotions, isolation from peers, and flat-out assault.
This landscape sucks. I want to help change it.

Women Who Code, PyLadies, Black Girls Code, RailsBridge, Girls Who Code, Girl
Develop It, and Lambda Ladies are just a few of the fantastic groups helping
women enter and thrive in software. I wholeheartedly support these efforts.

In addition, I want to help in my little corner of the technical
community–functional programming and distributed systems–by making high-quality
educational resources available for free. The
[Jepsen](https://aphyr.com/tags/jepsen) series has been, in part, an effort to
share my enthusiasm for distributed systems with beginners of all stripes–but
especially for women, LGBT folks, and people of color.

As technical authors, we often assume that our readers are white, that our
readers are straight, that our readers are traditionally male. This is the
invisible default in US culture, and it’s especially true in tech. People
continue to assume on the basis of my software and writing that I’m straight,
because well hey, it’s a statistically reasonable assumption.

But I’m not straight. I get called faggot, cocksucker, and sinner. People say
they’ll pray for me. When I walk hand-in-hand with my boyfriend, people roll
down their car windows and stare. They threaten to beat me up or kill me. Every
day I’m aware that I’m the only gay person some people know, and that I can
show that not all gay people are effeminate, or hypermasculine, or ditzy, or
obsessed with image. That you can be a manicurist or a mathematician or both.
Being different, being a stranger in your culture, comes with all kinds of
challenges. I can’t speak to everyone’s experience, but I can take a pretty
good guess.

At the same time, in the technical community I’ve found overwhelming warmth and
support, from people of all stripes. My peers stand up for me every day, and
I’m so thankful–especially you straight dudes–for understanding a bit of what
it’s like to be different. I want to extend that same understanding, that same
empathy, to people unlike myself. Moreover, I want to reassure everyone that
though they may feel different, they do have a place in this community.

So before we begin, I want to reinforce that you can program, that you can do
math, that you can design car suspensions and fire suppression systems and
spacecraft control software and distributed databases, regardless of what your
classmates and media and even fellow engineers think. You don’t have to be
white, you don’t have to be straight, you don’t have to be a man. You can grow
up never having touched a computer and still become a skilled programmer. Yeah,
it’s harder–and yeah, people will give you shit, but that’s not your fault and
has nothing to do with your ability or your right to do what you love. All it
takes to be a good engineer, scientist, or mathematician is your curiosity,
your passion, the right teaching material, and putting in the hours.

There’s nothing in this guide that’s just for lesbian grandmas or just for
mixed-race kids; bros, you’re welcome here too. There’s nothing dumbed down.
We’re gonna go as deep into the ideas of programming as I know how to go, and
we’re gonna do it with everyone on board.

No matter who you are or who people think you are, this guide is for you.

#### Why Clojure?

This book is about how to program. We’ll be learning in Clojure, which is a
modern dialect of a very old family of computer languages, called Lisp. You’ll
find that many of this book’s ideas will translate readily to other languages;
though they may be expressed in [different
ways](http://aphyr.com/posts/266-core-language-concepts).

We’re going to explore the nature of syntax, metalanguages, values, references,
mutation, control flow, and concurrency. Many languages leave these ideas
implicit in the language construction, or don’t have a concept of metalanguages
or concurrency at all. Clojure makes these ideas explicit, first-class language
constructs.

At the same time, we’re going to defer or omit any serious discussion of static
type analysis, hardware, and performance. This is not to say that these ideas
aren’t important; just that they don’t fit well within this particular
narrative arc. For a deep exploration of type theory I recommend a study in
Haskell, and for a better understanding of underlying hardware, learning C and
an assembly language will undoubtedly help.

In more general terms, Clojure is a well-rounded language. It offers broad
library support and runs on multiple operating systems. Clojure performance is
not terrific, but is orders of magnitude faster than Ruby, Python, or
Javascript. Unlike some faster languages, Clojure emphasizes safety in its type
system and approach to parallelism, making it easier to write correct
multithreaded programs. Clojure is concise, requiring very little code to
express complex operations. It offers a REPL and dynamic type system: ideal for
beginners to experiment with, and well-suited for manipulating complex data
structures. A consistently designed standard library and full-featured set of
core datatypes rounds out the Clojure toolbox.

Finally, there are some drawbacks. As a compiled language, Clojure is much
slower to start than a scripting language; this makes it unsuitable for writing
small scripts for interactive use. Clojure is also not well-suited for
high-performance numeric operations. Though it is possible, you have to jump
through hoops to achieve performance comparable with Java. I’ll do my best to
call out these constraints and shortcomings as we proceed through the text.

With that context out of the way, let’s get started by installing Clojure!

#### Getting set up

First, you’ll need a Java Virtual Machine, or JVM, and its associated
development tools, called the JDK. This is the software which runs a Clojure
program. If you’re on Windows, install [Oracle JDK
1.7](http://www.oracle.com/technetwork/java/javase/downloads/index.html). If
you’re on OS X or Linux, you may already have a JDK installed. In a terminal,
try:

```clojure
which javac
```

If you see something like

```clojure
/usr/bin/javac
```

Then you’re good to go. If you don’t see any output from that command, install
the appropriate [Oracle JDK
1.7](http://www.oracle.com/technetwork/java/javase/downloads/index.html) for
your operating system, or whatever JDK your package manager has available.

When you have a JDK, you’ll need [Leiningen](http://leiningen.org/), the
Clojure build tool. If you’re on a Linux or OS X computer, the instructions
below should get you going right away. If you’re on Windows, see the Leiningen
page for an installer. If you get stuck, you might want to start with a [primer
on command line basics](http://blog.teamtreehouse.com/command-line-basics).

```shell
mkdir -p ~/bin
cd ~/bin
curl -O https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod a+x lein
```

Leiningen automatically handles installing Clojure, finding libraries from the
internet, and building and running your programs. We’ll create a new Leiningen
project to play around in:

```shell
cd
lein new scratch
```

This creates a new directory in your homedir, called `scratch`. If you see
`command not found` instead, it means the directory `~/bin` isn’t registered with
your terminal as a place to search for programs. To fix this, add the line

```shell
export PATH="$PATH":~/bin
```

to the file `.bash_profile` in your home directory, then run `source
~/.bash_profile`. Re-running `lein new scratch` should work.

Let’s enter that directory, and start using Clojure itself:

```shell
cd scratch
lein repl
```

#### The structure of programs

When you type `lein repl` at the terminal, you’ll see something like this:

```shell
aphyr@waterhouse:~/scratch$ lein repl
nREPL server started on port 45413
REPL-y 0.2.0
Clojure 1.5.1
    Docs: (doc function-name-here)
          (find-doc "part-of-name-here")
  Source: (source function-name-here)
 Javadoc: (javadoc java-object-or-class-here)
    Exit: Control+D or (exit) or (quit)

user=>
```

This is an interactive Clojure environment called a REPL, for “Read, Evaluate,
Print Loop”. It’s going to read a program we enter, run that program, and print
the results. REPLs give you quick feedback, so they’re a great way to explore a
program interactively, run tests, and prototype new ideas.

Let’s write a simple program. The simplest, in fact. Type “nil”, and hit enter.

```clojure
user=> nil
nil
```

`nil` is the most basic value in Clojure. It represents emptiness, nothing-doing,
not-a-thing. The absence of information.

```clojure
user=> true
true
user=> false
false
```

`true` and `false` are a pair of special values called Booleans. They mean exactly
what you think: whether a statement is true or false. `true`, `false`, and `nil` form
the three poles of the Lisp logical system.

```clojure
user=> 0
0
```

This is the number zero. Its numeric friends are `1`, `-47`, `1.2e-4`, `1/3`, and so
on. We might also talk about *strings*, which are chunks of text surrounded by
double quotes:

```clojure
user=> "hi there!"
"hi there!"
```

`nil`, `true`, `0`, and `"hi there!"` are all different types of *values*; the nouns of
programming. Just as one could say “House.” in English, we can write a program
like `"hello, world"` and it evaluates to itself: the string `"hello world"`. But
most sentences aren’t just about stating the existence of a thing; they involve
*action*. We need *verbs*.

```
user=> inc
#<core$inc clojure.core$inc@6f7ef41c>
```

This is a verb called `inc`–short for “increment”. Specifically, `inc` is a
*symbol* which points to a verb: `#<core$inc clojure.core$inc@6f7ef41c>` – just like
the word “run” is a *name* for the *concept* of running.

There’s a key distinction here–that a signifier, a reference, a label, is not
the same as the signified, the referent, the concept itself. If you write the
word “run” on paper, the ink means nothing by itself. It’s just a symbol. But
in the mind of a reader, that symbol takes on *meaning*; the idea of running.

Unlike the number 0, or the string “hi”, symbols are references to other
values. when Clojure evaluates a symbol, it looks up that symbol’s meaning.
Look up `inc`, and you get `#<core$inc clojure.core$inc@6f7ef41c>`.

Can we refer to the symbol itself, *without* looking up its meaning?

```clojure
user=> 'inc
inc
```

Yes. The single quote ' escapes a sentence. In programming languages, we call
sentences expressions or statements. A quote says “Rather than evaluating this
expression’s text, simply return the text itself, unchanged.” Quote a symbol,
get a symbol. Quote a number, get a number. Quote anything, and get it back
exactly as it came in.

```clojure
user=> '123
123
user=> '"foo"
"foo"
user=> '(1 2 3)
(1 2 3)
```

A new kind of value, surrounded by parentheses: the list. LISP originally stood
for LISt Processing, and lists are still at the core of the language. In fact,
they form the most basic way to compose expressions, or sentences. A list is a
single expression which has multiple parts. For instance, this list contains
three elements: the numbers 1, 2, and 3. Lists can contain anything: numbers,
strings, even other lists:

```clojure
user=> '(nil "hi")
(nil "hi")
```

A list containing two elements: the number 1, and a second list. That list
contains two elements: the number 2, and another list. That list contains two
elements: 3, and an empty list.

```clojure
user=> '(1 (2 (3 ())))
(1 (2 (3 ())))
```

You could think of this structure as a tree–which is a provocative idea,
because languages are like trees too: sentences are comprised of clauses, which
can be nested, and each clause may have subjects modified by adjectives, and
verbs modified by adverbs, and so on. “Lindsay, my best friend, took the dog
which we found together at the pound on fourth street, for a walk with her
mother Michelle.”

```clojure
Took
  Lindsay
    my best friend
  the dog
    which we found together
      at the pound
        on fourth street
    for a walk
      with her mother
        Michelle
```

But let’s try something simpler. Something we know how to talk about.
“Increment the number zero.” As a tree:

```clojure
Increment
  the number zero
```

We have a symbol for incrementing, and we know how to write the number zero.
Let’s combine them in a list:

```clojure
clj=> '(inc 0)
(inc 0)
```

A basic sentence. Remember, since it’s quoted, we’re talking about the tree,
the text, the expression, by itself. Absent interpretation. If we remove the
single-quote, Clojure will interpret the expression:

```clojure
user=> (inc 0)
1
```

Incrementing zero yields one. And if we wanted to increment that value?

```clojure
Increment
  increment
    the number zero
user=> (inc (inc 0))
2
```

A sentence in Lisp is a list. It starts with a verb, and is followed by zero or
more objects for that verb to act on. Each part of the list can itself be
another list, in which case that nested list is evaluated first, just like a
nested clause in a sentence. When we type

```clojure
(inc (inc 0))
```

Clojure first looks up the meanings for the symbols in the code:

```clojure
(#<core$inc clojure.core$inc@6f7ef41c>
  (#<core$inc clojure.core$inc@6f7ef41c>
    0))
```

Then evaluates the innermost list (inc 0), which becomes the number 1:

```clojure
(#<core$inc clojure.core$inc@6f7ef41c>
 1)
```

Finally, it evaluates the outer list, incrementing the number 1:

``clojure
2
```

Every list starts with a verb. Parts of a list are evaluated from left to
right. Innermost lists are evaluated before outer lists.

```clojure
(+ 1 (- 5 2) (+ 3 4))
(+ 1 3       (+ 3 4))
(+ 1 3       7)
11
```

That’s it.

The entire grammar of Lisp: the structure for every expression in the language.
We transform expressions by substituting meanings for symbols, and obtain some
result. This is the core of the Lambda Calculus, and it is the theoretical
basis for almost all computer languages. Ruby, Javascript, C, Haskell; all
languages express the text of their programs in different ways, but internally
all construct a tree of expressions. Lisp simply makes it explicit.

#### Review

We started by learning a few basic nouns: numbers like 5, strings like "cat",
and symbols like inc and +. We saw how quoting makes the difference between an
expression itself and the thing it evaluates to. We discovered symbols as names
for other values, just like how words represent concepts in any other language.
Finally, we combined lists to make trees, and used those trees to represent a
program.

With these basic elements of syntax in place, it’s time to expand our
vocabulary with new verbs and nouns; learning to represent more complex values
and transform them in different ways.

### Basic types

https://aphyr.com/posts/302-clojure-from-the-ground-up-basic-types

### Functions

https://aphyr.com/posts/303-clojure-from-the-ground-up-functions

### Sequences

https://aphyr.com/posts/304-clojure-from-the-ground-up-sequences

### Macros

https://aphyr.com/posts/305-clojure-from-the-ground-up-macros

### State

https://aphyr.com/posts/306-clojure-from-the-ground-up-state

### Logistics

https://aphyr.com/posts/311-clojure-from-the-ground-up-logistics

### Modeling

https://aphyr.com/posts/312-clojure-from-the-ground-up-modeling

### Debugging

Writing software can be an exercise in frustration. Useless error messages,
difficult-to-reproduce bugs, missing stacktrace information, obscure functions
without documentation, and unmaintained libraries all stand in our way. As
software engineers, our most useful skill isn’t so much *knowing how to solve a
problem as knowing how to explore a problem that we haven’t seen before*.
Experience is important, but even experienced engineers face unfamiliar bugs
every day. When a problem doesn’t bear a resemblance to anything we’ve seen
before, we fall back on *general cognitive strategies* to explore–and ultimately
solve–the problem.

There’s an excellent book by the mathematician George Polya: [How to Solve
It](https://www.amazon.com/How-Solve-It-Mathematical-Princeton/dp/069111966X),
which tries to catalogue how successful mathematicians approach unfamiliar
problems. When I catch myself banging my head against a problem for more than a
few minutes, I try to back up and consider his
[principles](http://math.berkeley.edu/~gmelvin/polya.pdf). Sometimes, just
taking the time to slow down and reflect can get me out of a rut.

Understand the problem.

1. Devise a plan.
2. Carry out the plan
3. Look back
4. Seems easy enough, right? Let’s go a little deeper.

#### Understanding the problem

Well *obviously* there’s a problem, right? The program failed to compile, or a
test spat out bizarre numbers, or you hit an unexpected exception. But try to
dig a little deeper than that. Just having a careful description of the problem
can make the solution obvious.

```
Our audit program detected that users can double-withdraw cash from their
accounts.
```

What does your program do? Chances are your program is large and complex, so
try to *isolate* the problem as much as possible. Find *preconditions* where the
error holds.

```
The problem occurs after multiple transfers between accounts.
```

Identify specific lines of code from the stacktrace that are involved, specific
data that’s being passed around. Can you find a particular function that’s
misbehaving?

```
The balance transfer function sometimes doesn’t increase or decrease the
account values correctly.
```

What are that function’s inputs and outputs? Are the inputs what you expected?
What did you expect the result to be, given those arguments? It’s not enough to
know “it doesn’t work” – you need to know exactly what *should* have happened. Try
to find conditions where the function works correctly, so you can map out the
boundaries of the problem.

```
Trying to transfer $100 from A to B works as expected, as does a transfer of
$50 from B to A. Running a million random transfers between accounts,
sequentially, results in correct balances. The problem only seems to happen in
production.
```

If your function–or functions it calls–uses mutable state, like an agent, atom,
or ref, the value of those references matters too. This is why you should avoid
mutable state wherever possible: each mutable variable introduces another
dimension of possible behaviors for your program. Print out those values when
they’re read, and after they’re written, to get a description of what the
function is actually doing. I am a huge believer in sprinkling `(prn x)`
throughout one’s code to print how state evolves when the program runs.

```
Each balance is stored in a separate atom. When two transfers happen at the
same time involving the same accounts, the new value of one or both atoms may
not reflect the transfer correctly.
```

Look for invariants: properties that should always be true of a program. Devise
a test to look for where those invariants are broken. Consider each individual
step of the program: does it preserve all the invariants you need? If it
doesn’t, what ensures those invariants are restored correctly?

```
The total amount of money in the system should be constant–but sometimes changes!
```

Draw diagrams, and invent a notation to talk about the problem. If you’re
accessing fields in a vector, try drawing the vector as a set of boxes, and
drawing the fields it accesses, step by step on paper. If you’re manipulating a
tree, draw one! Figure out a way to write down the state of the system: in
letters, numbers, arrows, graphs, whatever you can dream up.

```
Transferring $5 from A to B in transaction 1, and $5 from B to A in transaction 2:

Transaction  |  A  |  B
-------------+-----+-----
txn1 read    |  10 |  10   ; Transaction 1 sees 10, 10
txn1 write A |   5 |  10   ; A and B now out-of-sync
txn2 read    |   5 |  10   ; Transaction 2 sees 5, 10
txn1 write B |   5 |  15   ; Transaction 1 completes
txn2 write A |  10 |  15   ; Transaction 2 writes based on out-of-sync read
txn2 write B |   5 |  5    ; Should have been 10, 10!
```

This doesn’t *solve* the problem, but helps us *explore* the problem in depth.
Sometimes this makes the solution obvious–other times, we’re just left with a
pile of disjoint facts. Even if things look jumbled-up and confusing, don’t
despair! Exploring gives the brain the pieces; it’ll link them together over
time.

Armed with a detailed *description*	 of the problem, we’re much better equipped to
solve it.

#### Devise a plan

Our brains are excellent pattern-matchers, but not that great at tracking abstract logical operations. Try changing your viewpoint: rotating the problem into a representation that’s a little more tractable for your mind. Is there a similar problem you’ve seen in the past? Is this a well-known problem?

Make sure you know how to *check* the solution. With the problem isolated to a single function, we can write a test case that verifies the account balances are correct. Then we can experiment freely, and have some confidence that we’ve actually found a solution.

Can you solve a *related* problem? If only concurrent transfers trigger the
problem, could we solve the issue by ensuring transactions never take place
concurrently–e.g. by wrapping the operation in a lock? Could we solve it by
*logging* all transactions, and replaying the log? Is there a simpler variant of
the problem that might be tractable–maybe one that always *overcounts*, but never
*undercounts*?

Consider your assumptions. We rely on layers of abstraction in writing
software–that changing a variable is atomic, that lexical variables don’t
change, that adding 1 and 1 always gives 2. Sometimes, parts of the computer
*fail* to guarantee those abstractions hold. The CPU might–very rarely–fail to
divide numbers correctly. A library might, for supposedly valid input, spit out
a bad result. A numeric algorithm might fail to converge, and spit out wrong
numbers. To avoid questioning *everything*, start in your own code, and work
your way down to the assumptions themselves. See if you can devise tests that
check the language or library is behaving as you expect.

Can you avoid solving the problem altogether? Is there a library, database, or
language feature that does transaction management for us? Is integrating that
library worth the reduced complexity in our application?

We’re not mathematicians; we’re engineers. Part theorist, yes, but also part mechanic. Some problems take a more abstract approach, and others are better approached by tapping it with a wrench and checking the service manual. If other people have solved your problem already, using their solution can be much simpler than devising your own.

Can you think of a way to get more diagnostic information? Perhaps we could log
more data from the functions that are misbehaving, or find a way to dump and
replay transactions from the live program. Some problems *disappear* when
instrumented; these are the hardest to solve, but also the most rewarding.

Combine key phrases in a Google search: the name of the library you’re using,
the type of exception thrown, any error codes or log messages. Often you’ll
find a StackOverflow result, a mailing list post, or a Github issue that
describes your problem. This works well when you know the technical terms for
your problem–in our case, that we’re performing a *atomic*, *transactional*
transfer between two variables. Sometimes, though, you don’t *know* the
established names for your problem, and have to resort to blind queries like
“variables out of sync” or “overwritten data”–which are much more difficult.

When you get stuck exploring on your own, try asking for help. Collect your
description of the problem, the steps you took, and what you expected the
program to do. Include any stacktraces or error messages, log files, and the
smallest section of source code required to reproduce the problem. Also include
the versions of software used–in Clojure, typically the JVM version (`java
-version`), Clojure version (`project.clj`), and any other relevant library
versions.

If the project has a Github page or public issue tracker, like Jira, you can
try filing an issue there. Here’s a [particularly well-written
issue](https://github.com/aphyr/riemann-dash/issues/66) filed by a user on one
of my projects. Note that this user included installation instructions, the
command they ran, and the stacktrace it printed. The more specific a
description you provide, the easier it is for someone else to understand your
problem and help!

Sometimes you need to talk through a problem interactively. For that, I prefer
IRC–many projects have a channel on [the Freenode IRC
network](http://freenode.net/) where you can ask basic questions. Remember to
be respectful of the channel’s time; there may be hundreds of users present,
and they have to sort through everything you write.  Paste your problem
description into a *pastebin* like [Gist](https://gist.github.com/), then
mention the link in IRC with a short–say a few sentences–description of the
problem. I try asking in a channel devoted to a specific library or program
first, then back off to a more general channel, like #clojure. There’s no need
to ask “Can I ask a question” first–just jump in.

Since the transactional problem we’ve been exploring seems like a general issue
with atoms, I might ask in #clojure

```
aphyr > Hi! Does anyone know the right way to change multiple atoms at the same time?
aphyr > This function and test case (http://gist.github.com/...) seems to double-
        or under-count when invoked concurrently.
```

Finally, you can join the project’s email list, and ask your question there.
Turnaround times are longer, but you’ll often find a more in-depth response to
your question via email. This applies especially if you and the maintainer are
in different time zones, or if they’re busy with life. You can also ask
specific problems on StackOverflow or other message boards; users there can be
incredibly helpful.

Remember, other engineers are taking time away from their work, family,
friends, and hobbies to help you. It’s always polite to give them time to
answer first–they may have other priorities. A sincere thank-you is always
appreciated–as is paying it forward by answering other users' questions on the
list or channel!

#### Dealing with abuse

Sadly, some women, LGBT people, and so on experience harassment on IRC or in
other discussion circles. They may be asked inappropriate personal questions,
insulted, threatened, assumed to be straight, to be a man, and so on. Sometimes
other users will attack questioners for inexperience. Exclusion can be overt
(“Read the fucking docs, faggot!”) or more subtle (“Hey dudes, what’s up?”). It
only takes one hurtful experience this to sour someone on an entire community.

If this happens to you, **place your own well-being first**. You are *not* obligated
to fix anyone else’s problems, or to remain in a social context that makes you
uncomfortable.

That said, be aware the other people in a channel may not share your culture.
English may not be their main language, or they may have said something hurtful
without realizing its impact. Explaining how the comment made you feel can jar
a well-meaning but unaware person into reconsidering their actions.

Other times, people are just *mean*–and it only takes one to ruin everybody’s
day. When this happens, you can appeal to a moderator. On IRC, moderators are
sometimes identified by an `@` sign in front of their name; on forums, they may
have a special mark on their username or profile. Large projects may have an
official policy for reporting abuse on their website or in the channel topic.
If there’s no policy, try asking whoever seems in charge for help. Most
projects have a primary maintainer or community manager with the power to mute
or ban malicious users.

Again, these ways of dealing with abuse are *optional*. You have no
responsibility to provide others with endless patience, and it is not your
responsibility to fix a toxic culture. You can always log off and try something
else. There are many communities which will welcome and support you–it may just
take a few tries to find the right fit.

If you don’t find community, you can *build* it. Starting your own IRC channel,
mailing list, or discussion group with a few friends can be a great way to help
each other learn in a supportive environment. And if trolls ever come calling,
you’ll be able to ban them personally.

Now, back to problem-solving.

#### Execute the plan

Sometimes we can make a quick fix in the codebase, test it by hand, and move
on. But for more serious problems, we’ll need a more involved process. I always
try to get a reproducible test suite–one that runs in a matter of seconds–so
that I can continually check my work.

Persist. Many problems require grinding away for some time. Mix blind
experimentation with sitting back and planning. Periodically re-evaluate your
work–have you made progress? Identified a sub-problem that can be solved
independently? Developed a new notation?

If you get stuck, try a new tack. Save your approach as a comment or using `git
stash`, and start fresh. Maybe using a different concurrency primitive is in
order, or rephrasing the data structure entirely. Take a reading break and
review the documentation for the library you’re trying to use. Read the *source
code* for the functions you’re calling–even if you don’t understand exactly what
it does, it might give you clues to how things work under the hood.

Bounce your problem off a friend. Grab a sheet of paper or whiteboard, describe
the problem, and work through your thinking with that person. Their
understanding of the problem might be totally off-base, but can still give you
valuable insight. Maybe they know exactly what the problem is, and can point
you to a solution in thirty seconds!

Finally, take a break. Go home. Go for a walk. Lift heavy, run hard, space out,
drink with your friends, practice music, read a book. Just before sleep, go
over the problem once more in your head; I often wake up with a new algorithm
or new questions burning to get out. Your unconscious mind can come up with
unexpected insights if given time *away* from the problem!

Some folks swear by time in the shower, others by hiking, or with pen and paper
in a hammock. Find what works for you! The important thing seems to be giving
yourself *away* from struggling with the problem.

#### Look back

Chances are you’ll know as soon as your solution works. The program compiles,
transactions generate the correct amounts, etc. Now’s an important time to
*solidify* your work.

Bolster your tests. You may have made the problem less *likely*, but not actually
solved it. Try a more aggressive, randomized test; one that runs for longer,
that generates a broader class of input. Try it on a copy of the production
workload before deploying your change.

Identify *why* the new system works. Pasting something in from StackOverflow may
get you through the day, but won’t help you solve similar problems in the
future. Try to really understand *why* the program went wrong, and how the new
pieces work together to prevent the problem. Is there a more general underlying
problem? Could you generalize your technique to solve a related problem? If
you’ll encounter this type of issue frequently, could you build a function or
library to help build other solutions?

Document the solution. Write down your description of the problem, and why your
changes fix it, as comments in the source code. Use that same description of
the solution in your commit message, or attach it as a comment to the resources
you used online, so that other people can come to the same understanding.

#### Debugging Clojure

With these general strategies in mind, I’d like to talk specifically about the
debugging *Clojure* code–especially understanding its *stacktraces*. Consider this
simple program for baking cakes:

```clojure
(ns scratch.debugging)

(defn bake
  "Bakes a cake for a certain amount of time, returning a cake with a new
  :tastiness level."
  [pie temp time]
  (assoc pie :tastiness
         (condp (* temp time) <
           400 :burned
           350 :perfect
           300 :soggy)))
```

And in the REPL

```clojure
user=> (bake {:flavor :blackberry} 375 10.25)

ClassCastException java.lang.Double cannot be cast to clojure.lang.IFn  scratch.debugging/bake (debugging.clj:8)
```

This is not particularly helpful. Let’s print a full stacktrace using pst:

```clojure
user=> (pst)
ClassCastException java.lang.Double cannot be cast to clojure.lang.IFn
    scratch.debugging/bake (debugging.clj:8)
    user/eval1223 (form-init4495957503656407289.clj:1)
    clojure.lang.Compiler.eval (Compiler.java:6619)
    clojure.lang.Compiler.eval (Compiler.java:6582)
    clojure.core/eval (core.clj:2852)
    clojure.main/repl/read-eval-print--6588/fn--6591 (main.clj:259)
    clojure.main/repl/read-eval-print--6588 (main.clj:259)
    clojure.main/repl/fn--6597 (main.clj:277)
    clojure.main/repl (main.clj:277)
    clojure.tools.nrepl.middleware.interruptible-eval/evaluate/fn--591 (interruptible_eval.clj:56)
    clojure.core/apply (core.clj:617)
    clojure.core/with-bindings* (core.clj:1788)
```

The first line tells us the *type* of the error: a `ClassCastException`. Then
there’s some explanatory text: we can’t cast a `java.lang.Double` to a
`clojure.lang.IFn`. The indented lines show the functions that led to the error.
The first line is the deepest function, where the error actually occurred: the
`bake` function in the `scratch.debugging` namespace. In parentheses is the file
name (`debugging.clj`) and line number (`8`) from the code that caused the error.
Each following line shows the function that *called* the previous line. In the
REPL, our code is invoked from a special function compiled by the REPL
itself–with an automatically generated name like `user/eval1223`, and that
function is invoked by the Clojure compiler, and the REPL tooling. Once we see
something like `Compiler.eval` at the repl, we can generally skip the rest.

As a general rule, we want to look at the *deepest* (earliest) point in the
stacktrace that we *wrote*. Sometimes an error will arise from deep within a
library or Clojure itself–but it was probably *invoked*	 by our code somewhere.
We’ll skim down the lines until we find our namespace, and start our
investigation at that point.

Our case is simple: `bake.clj`, on line 8, seems to be the culprit.

```clojure
         (condp (* temp time) <
```

Now let’s consider the error itself: ClassCastException: java.lang.Double
cannot be cast to clojure.lang.IFn. This implies we had a Double and tried to
cast it to an IFn–but what does “cast” mean? For that matter, what’s a Double,
or an IFn?

A quick google search for java.lang.Double reveals that it’s a class (a Java
type) with some basic documentation. “The Double class wraps a value of the
primitive type double in an object” is not particularly informative–but the
“class hierarchy” at the top of the page shows that a Double is a kind of
java.lang.Number. Let’s experiment at the REPL:

----------------------------

```clojure
user=> (type 4)
java.lang.Long
user=> (type 4.5)
java.lang.Double
```

Indeed: decimal numbers in Clojure appear to be doubles. One of the expressions
in that condp call was probably a decimal. At first we might suspect the
literal values 300, 350, or 400–but those are Longs, not Doubles. The only
Double we passed in was the time duration 10.25–which appears in condp as (*
temp time). That first argument was a Double, but should have been an IFn.

What the heck is an IFn? Its source code has a comment:

IFn provides complete access to invoking any of Clojure’s API’s. You can also access any other library written in Clojure, after adding either its source or compiled form to the classpath.

So IFn has to do with invoking Clojure’s API. Ah–Fn probably stands for
function–and this class is chock full of things like invoke(Object arg1, Object
arg2). That suggests that IFn is about calling functions. And the I? Google
suggests it’s a Java convention for an interface–whatever that is. Remember, we
don’t have to understand everything–just enough to get by. There’s plenty to
explore later.

Let’s check our hypothesis in the repl:

```clojure
user=> (instance? clojure.lang.IFn 2.5)
false
user=> (instance? clojure.lang.IFn conj)
true
user=> (instance? clojure.lang.IFn (fn [x] (inc x)))
true
```

So Doubles aren’t IFns–but Clojure built-in functions, and anonymous functions,
both are. Let’s double-check the docs for condp again:

```clojure
user=> (doc condp)
-------------------------
clojure.core/condp
([pred expr & clauses])


Macro
  Takes a binary predicate, an expression, and a set of clauses.
  Each clause can take the form of either:

  test-expr result-expr

  test-expr :>> result-fn

  Note :>> is an ordinary keyword.

  For each clause, (pred test-expr expr) is evaluated. If it returns
  logical true, the clause is a match. If a binary clause matches, the
  result-expr is returned, if a ternary clause matches, its result-fn,
  which must be a unary function, is called with the result of the
  predicate as its argument, the result of that call being the return
  value of condp. A single default expression can follow the clauses,
  and its value will be returned if no clause matches. If no default
  expression is provided and no clause matches, an
  IllegalArgumentException is thrown.clj
```

That’s a lot to take in! No wonder we got it wrong! We’ll take it slow, and
look at the arguments.

```clojure
(condp (* temp time) <
```

Our pred was (* temp time) (a Double), and our expr was the comparison function
<. For each clause, (pred test-expr expr) is evaluated, so that would expand to
something like

```clojure
((* temp time) 400 <)
```

Which evaluates to something like

```clojure
(123.45 400 <)
```

But this isn’t a valid Lisp program! It starts with a number, not a function.
We should have written (< 123.45 400). Our arguments are backwards!

```clojure
(defn bake
  "Bakes a cake for a certain amount of time, returning a cake with a new
  :tastiness level."
  [pie temp time]
  (assoc pie :tastiness
         (condp < (* temp time)
           400 :burned
           350 :perfect
           300 :soggy)))
user=> (use 'scratch.debugging :reload)
nil
user=> (bake {:flavor :chocolate} 375 10.25)
{:tastiness :burned, :flavor :chocolate}
user=> (bake {:flavor :chocolate} 450 0.8)
{:tastiness :perfect, :flavor :chocolate}
```

Mission accomplished! We read the stacktrace as a path to a part of the program
where things went wrong. We identified the deepest part of that path in our
code, and looked for a problem there. We discovered that we had reversed the
arguments to a function, and after some research and experimentation in the
REPL, figured out the right order.

An aside on types: some languages have a stricter type system than Clojure’s,
in which the types of variables are explicitly declared in the program’s source
code. Those languages can detect type errors–when a variable of one type is
used in place of another, incompatible, type–and offer more precise feedback.
In Clojure, the compiler does not generally enforce types at compile time,
which allows for significant flexibility–but requires more rigorous testing to
expose these errors.

#### Higher order stacktraces

The stacktrace shows us a path through the program, moving downwards through
functions. However, that path may not be straightforward. When data is handed
off from one part of the program to another, the stacktrace may not show the
origin of an error. When functions are handed off from one part of the program
to another, the resulting traces can be tricky to interpret indeed.

For instance, say we wanted to make some picture frames out of wood, but didn’t
know how much wood to buy. We might sketch out a program like this:

```clojure
(defn perimeter
  "Given a rectangle, returns a vector of its edge lengths."
  [rect]
  [(:x rect)
   (:y rect)
   (:z rect)
   (:y rect)])

(defn frame
  "Given a mat width, and a photo rectangle, figure out the size of the frame
  required by adding the mat width around all edges of the photo."
  [mat-width rect]
  (let [margin (* 2 rect)]
    {:x (+ margin (:x rect))
     :y (+ margin (:y rect))}))

(def failure-rate
  "Sometimes the wood is knotty or we screw up a cut. We'll assume we need a
  spare segment once every 8."
  1/8)

(defn spares
  "Given a list of segments, figure out roughly how many of each distinct size
  will go bad, and emit a sequence of spare segments, assuming we screw up
  `failure-rate` of them."
  [segments]
  (->> segments
       ; Compute a map of each segment length to the number of
       ; segments we'll need of that size.
       frequencies
       ; Make a list of spares for each segment length,
       ; based on how often we think we'll screw up.
       (mapcat (fn [ [segment n]]
                 (repeat (* failure-rate n)
                         segment)))))

(def cut-size
  "How much extra wood do we need for each cut? Let's say a mitred cut for a
  1-inch frame needs a full inch."
  1)

(defn total-wood
  [mat-width photos]
  "Given a mat width and a collection of photos, compute the total linear
  amount of wood we need to buy in order to make frames for each, given a
  2-inch mat."
  (let [segments (->> photos
                      ; Convert photos to frame dimensions
                      (map (partial frame mat-width))
                      ; Convert frames to segments
                      (mapcat perimeter))]

    ; Now, take segments
    (->> segments
         ; Add the spares
         (concat (spares segments))
         ; Include a cut between each segment
         (interpose cut-size)
         ; And sum the whole shebang.
         (reduce +))))

(->> [{:x 8
       :y 10}
      {:x 10
       :y 8}
      {:x 20
       :y 30}]
     (total-wood 2)
     (println "total inches:"))
```

Running this program yields a curious stacktrace. We’ll print the full trace
(not the shortened one that comes with pst) for the last exception *e with the
.printStackTrace function.

```clojure
user=> (.printStackTrace *e)
java.lang.ClassCastException: clojure.lang.PersistentArrayMap cannot be cast to java.lang.Number, compiling:(scratch/debugging.clj:73:23)
    at clojure.lang.Compiler.load(Compiler.java:7142)
    at clojure.lang.RT.loadResourceScript(RT.java:370)
    at clojure.lang.RT.loadResourceScript(RT.java:361)
    at clojure.lang.RT.load(RT.java:440)
    at clojure.lang.RT.load(RT.java:411)
        ...
    at java.lang.Thread.run(Thread.java:745)
Caused by: java.lang.ClassCastException: clojure.lang.PersistentArrayMap cannot be cast to java.lang.Number
    at clojure.lang.Numbers.multiply(Numbers.java:146)
    at clojure.lang.Numbers.multiply(Numbers.java:3659)
    at scratch.debugging$frame.invoke(debugging.clj:26)
    at clojure.lang.AFn.applyToHelper(AFn.java:156)
    at clojure.lang.AFn.applyTo(AFn.java:144)
    at clojure.core$apply.invoke(core.clj:626)
    at clojure.core$partial$fn__4228.doInvoke(core.clj:2468)
    at clojure.lang.RestFn.invoke(RestFn.java:408)
    at clojure.core$map$fn__4245.invoke(core.clj:2557)
    at clojure.lang.LazySeq.sval(LazySeq.java:40)
    at clojure.lang.LazySeq.seq(LazySeq.java:49)
    at clojure.lang.RT.seq(RT.java:484)
    at clojure.core$seq.invoke(core.clj:133)
    at clojure.core$map$fn__4245.invoke(core.clj:2551)
    at clojure.lang.LazySeq.sval(LazySeq.java:40)
    at clojure.lang.LazySeq.seq(LazySeq.java:49)
    at clojure.lang.RT.seq(RT.java:484)
    at clojure.core$seq.invoke(core.clj:133)
    at clojure.core$apply.invoke(core.clj:624)
    at clojure.core$mapcat.doInvoke(core.clj:2586)
    at clojure.lang.RestFn.invoke(RestFn.java:423)
    at scratch.debugging$total_wood.invoke(debugging.clj:62)
        ...
```

First: this trace has two parts. The top-level error (a CompilerException)
appears first, and is followed by the exception that caused the
CompilerException: a ClassCastException. This makes the stacktrace read
somewhat out of order, since the deepest part of the trace occurs in the first
line of the last exception. We read C B A then F E D. This is an old convention
in the Java language, and the cause of no end of frustration.

Notice that this representation of the stacktrace is less friendly than (pst).
We’re seeing the Java Virtual Machine (JVM)’s internal representation of
Clojure functions, which look like clojure.core$partial$fn__4228.doInvoke. This
corresponds to the namespace clojure.core, in which there is a function called
partial, inside of which is an anonymous function, here named fn__4228. Calling
a Clojure function is written, in the JVM, as .invoke or .doInvoke.

So: the root cause was a ClassCastException, and it tells us that Clojure
expected a java.lang.Number, but found a PersistentArrayMap. We might guess
that PersistentArrayMap is something to do with the map data structure, which
we used in this program:

```clojure
user=> (type {:x 1})
clojure.lang.PersistentArrayMap
```

And we’d be right. We can also tell, by reading down the stacktrace looking for
our scratch.debugging namespace, where the error took place:
scratch.debugging$frame, on line 26.

```clojure
  (let [margin (* 2 rect)]
```

There’s our multiplication operation *, which we might assume expands to
clojure.lang.Numbers.multiply. But the path to the error is odd.

```clojure
                 (->> photos
                      ; Convert photos to frame dimensions
                      (map (partial frame mat-width))
```

In total-wood, we call (map (partial frame mat-width) photos) right away, so
we’d expect the stacktrace to go from total-wood to map to frame. But this is
not what happens. Instead, total-wood invokes something called RestFn–a piece
of Clojure plumbing–which in turn calls mapcat.

```clojure
at clojure.core$mapcat.doInvoke(core.clj:2586)
    at clojure.lang.RestFn.invoke(RestFn.java:423)
    at scratch.debugging$total_wood.invoke(debugging.clj:62)
```

Why doesn’t total-wood call map first? Well it did–but map doesn’t actually
apply its function to anything in the photos vector when invoked. Instead, it
returns a lazy sequence–one which applies frame only when elements are asked
for.

```clojure
user=> (type (map inc (range 10)))
clojure.lang.LazySeq
```

Inside each LazySeq is a box containing a function. When you ask a LazySeq for
its first value, it calls that function to return a new sequence–and that’s
when frame gets invoked. What we’re seeing in this stacktrace is the LazySeq
internal machinery at work–mapcat asks it for a value, and the LazySeq asks map
to generate that value.

```clojure
at clojure.core$partial$fn__4228.doInvoke(core.clj:2468)
    at clojure.lang.RestFn.invoke(RestFn.java:408)
    at clojure.core$map$fn__4245.invoke(core.clj:2557)
    at clojure.lang.LazySeq.sval(LazySeq.java:40)
    at clojure.lang.LazySeq.seq(LazySeq.java:49)
    at clojure.lang.RT.seq(RT.java:484)
    at clojure.core$seq.invoke(core.clj:133)
    at clojure.core$map$fn__4245.invoke(core.clj:2551)
    at clojure.lang.LazySeq.sval(LazySeq.java:40)
    at clojure.lang.LazySeq.seq(LazySeq.java:49)
    at clojure.lang.RT.seq(RT.java:484)
    at clojure.core$seq.invoke(core.clj:133)
    at clojure.core$apply.invoke(core.clj:624)
    at clojure.core$mapcat.doInvoke(core.clj:2586)
    at clojure.lang.RestFn.invoke(RestFn.java:423)
    at scratch.debugging$total_wood.invoke(debugging.clj:62)
```

In fact we pass through map’s laziness twice here: a quick peek at (source
mapcat) shows that it expands into a map call itself, and then there’s a second
map: the one we created in in total-wood. Then an odd thing happens–we hit
something called clojure.core$partial$fn__4228.

```clojure
  (map (partial frame mat-width) photos)
```

The frame function takes two arguments: a mat width and a photo. We wanted a
function that takes just one argument: a photo. (partial frame mat-width) took
mat-width and generated a new function which takes one arg–call it photo–and
calls (frame mad-width photo). That automatically generated function, returned
by partial, is what map uses to generate new elements of its sequence on
demand.

```clojure
user=> (partial + 1)
#<core$partial$fn__4228 clojure.core$partial$fn__4228@243634f2>
user=> ((partial + 1) 4)
5
```

That’s why we see control flow through clojure.core$partial$fn__4228 (an
anonymous function defined inside clojure.core/partial) on the way to frame.

```clojure
Caused by: java.lang.ClassCastException: clojure.lang.PersistentArrayMap cannot be cast to java.lang.Number
    at clojure.lang.Numbers.multiply(Numbers.java:146)
    at clojure.lang.Numbers.multiply(Numbers.java:3659)
    at scratch.debugging$frame.invoke(debugging.clj:26)
    at clojure.lang.AFn.applyToHelper(AFn.java:156)
    at clojure.lang.AFn.applyTo(AFn.java:144)
    at clojure.core$apply.invoke(core.clj:626)
    at clojure.core$partial$fn__4228.doInvoke(core.clj:2468)
```

And there’s our suspect! scratch.debugging/frame, at line 26. To return to that
line again:

```clojure
  (let [margin (* 2 rect)]
```

* is a multiplication, and 2 is obviously a number, but rect… rect is a map
  here. Aha! We meant to multiply the mat-width by two, not the rectangle.

```clojure
(defn frame
  "Given a mat width, and a photo rectangle, figure out the size of the frame
  required by adding the mat width around all edges of the photo."
  [mat-width rect]
  (let [margin (* 2 mat-width)]
    {:x (+ margin (:x rect))
     :y (+ margin (:y rect))}))
```

I believe we’ve fixed the bug, then. Let’s give it a shot!

The unbearable lightness of nil
There’s one more bug lurking in this program. This one’s stacktrace is short.

```clojure
user=> (use 'scratch.debugging :reload)

CompilerException java.lang.NullPointerException, compiling:(scratch/debugging.clj:73:23) 
user=> (pst)
CompilerException java.lang.NullPointerException, compiling:(scratch/debugging.clj:73:23)
    clojure.lang.Compiler.load (Compiler.java:7142)
    clojure.lang.RT.loadResourceScript (RT.java:370)
    clojure.lang.RT.loadResourceScript (RT.java:361)
    clojure.lang.RT.load (RT.java:440)
    clojure.lang.RT.load (RT.java:411)
    clojure.core/load/fn--5066 (core.clj:5641)
    clojure.core/load (core.clj:5640)
    clojure.core/load-one (core.clj:5446)
    clojure.core/load-lib/fn--5015 (core.clj:5486)
    clojure.core/load-lib (core.clj:5485)
    clojure.core/apply (core.clj:626)
    clojure.core/load-libs (core.clj:5524)
Caused by:
NullPointerException 
    clojure.lang.Numbers.ops (Numbers.java:961)
    clojure.lang.Numbers.add (Numbers.java:126)
    clojure.core/+ (core.clj:951)
    clojure.core.protocols/fn--6086 (protocols.clj:143)
    clojure.core.protocols/fn--6057/G--6052--6066 (protocols.clj:19)
    clojure.core.protocols/seq-reduce (protocols.clj:27)
    clojure.core.protocols/fn--6078 (protocols.clj:53)
    clojure.core.protocols/fn--6031/G--6026--6044 (protocols.clj:13)
    clojure.core/reduce (core.clj:6287)
    scratch.debugging/total-wood (debugging.clj:69)
    scratch.debugging/eval1560 (debugging.clj:81)
    clojure.lang.Compiler.eval (Compiler.java:6703)
```

On line 69, total-wood calls reduce, which dives through a series of functions
from clojure.core.protocols before emerging in +: the function we passed to
reduce. Reduce is trying to combine two elements from its collection of wood
segments using +, but one of them was nil. Clojure calls this a
NullPointerException. In total-wood, we constructed the sequence of segments
this way:

```clojure
  (let [segments (->> photos
                      ; Convert photos to frame dimensions
                      (map (partial frame mat-width))
                      ; Convert frames to segments
                      (mapcat perimeter))]

    ; Now, take segments
    (->> segments
         ; Add the spares
         (concat (spares segments))
         ; Include a cut between each segment
         (interpose cut-size)
         ; And sum the whole shebang.
         (reduce +))))
```

Where did the nil value come from? The stacktrace doesn’t say, because the
sequence reduce is traversing didn’t have any problem producing the nil. reduce
asked for a value and the sequence happily produced a nil. We only had a
problem when it came time to combine the nil with the next value, using +.

A stacktrace like this is something like a murder mystery: we know the program
died in the reducer, that it was shot with a +, and the bullet was a nil–but we
don’t know where the bullet came from. The trail runs cold. We need more
forensic information–more hints about the nil’s origin–to find the culprit.

Again, this is a class of error largely preventable with static type systems.
If you have worked with a statically typed language in the past, it may be
interesting to consider that almost every Clojure function takes Option[A] and
does something more-or-less sensible, returning Option[B]. Whether the error
propagates as a nil or an Option, there can be similar difficulties in
localizing the cause of the problem.

Let’s try printing out the state as reduce goes along:

```
    (->> segments
         ; Add the spares
         (concat (spares segments))
         ; Include a cut between each segment
         (interpose cut-size)
         ; And sum the whole shebang.
         (reduce (fn [acc x] (prn acc x) (+ acc x))))))
user=> (use 'scratch.debugging :reload)
12 1
13 14
27 1
28 nil

CompilerException java.lang.NullPointerException, compiling:(scratch/debugging.clj:73:56) 
```

Not every value is nil! There’s a 14 there which looks like a plausible segment
for a frame, and two one-inch buffers from cut-size. We can rule out interpose
because it inserts a 1 every time, and that 1 reduces correctly. But where’s
that nil coming from? Is from segments or (spares segments)?

```clojure
  (let [segments (->> photos
                      ; Convert photos to frame dimensions
                      (map (partial frame mat-width))
                      ; Convert frames to segments
                      (mapcat perimeter))]

    (prn :segments segments)
user=> (use 'scratch.debugging :reload)
:segments (12 14 nil 14 14 12 nil 12 24 34 nil 34)
```

It is present in segments. Let’s trace it backwards through the sequence’s
creation. It’d be handy to have a function like prn that returned its input, so
we could spy on values as they flowed through the ->> macro.

```clojure
(defn spy
  [& args]
  (apply prn args)
  (last args))
  (let [segments (->> photos
                      ; Convert photos to frame dimensions
                      (map (partial frame mat-width))
                      (spy :frames)
                      ; Convert frames to segments
                      (mapcat perimeter))]
user=> (use 'scratch.debugging :reload)
:frames ({:x 12, :y 14} {:x 14, :y 12} {:x 24, :y 34})
:segments (12 14 nil 14 14 12 nil 12 24 34 nil 34)
```

Ah! So the frames are intact, but the perimeters are bad. Let’s check the perimeter function:

```clojure
(defn perimeter
  "Given a rectangle, returns a vector of its edge lengths."
  [rect]
  [(:x rect)
   (:y rect)
   (:z rect)
   (:y rect)])
```

Spot the typo? We wrote :z instead of :x. Since the frame didn’t have a :z
field, it returned nil! That’s the origin of our NullPointerException. With the
bug fixed, we can re-run and find:

```clojure
user=> (use 'scratch.debugging :reload)
total inches: 319
```

Whallah!

#### Recap

As we solve more and more problems, we get faster at debugging–at skipping over
irrelevant log data, figuring out exactly what input was at fault, knowing what
terms to search for, and developing a network of peers and mentors to ask for
help. But when we encounter unexpected bugs, it can help to fall back on a
family of problem-solving tactics.

We explore the problem thoroughly, localizing it to a particular function,
variable, or set of inputs. We identify the boundaries of the problem, carving
away parts of the system that work as expected. We develop new notation, maps,
and diagrams of the problem space, precisely characterizing it in a variety of
modes.

With the problem identified, we search for extant solutions–or related problems
others have solved in the past. We trawl through issue trackers, mailing list
posts, blogs, and forums like Stackoverflow, or, for more theoretical problems,
academic papers, Mathworld, and Wikipedia, etc. If searching reveals nothing,
we try rephrasing the problem, relaxing the constraints, adding debugging
statements, and solving smaller subproblems. When all else fails, we ask for
help from our peers, or from the community in IRC, mailing lists, and so on, or
just take a break.

We learned to explore Clojure stacktraces as a trail into our programs, leading
to the place where an error occurred. But not all paths are linear, and we saw
how lazy operations and higher-order functions create inversions and
intermediate layers in the stacktrace. Then we learned how to debug values that
were distant from the trace, by adding logging statements and working our way
closer to the origin.

Programming languages and us, their users, are engaged in a continual dialogue.
We may speak more formally, verbosely, with many types and defensive
assertions–or we may speak quickly, generally, in fuzzy terms. The more precise
we are with the specifications of our program’s types, the more the program can
assist us when things go wrong. Conversely, those specifications harden our
programs into strong but rigid forms, and rigid structures are harder to bend
into new shapes.

In Clojure we strike a more dynamic balance: we speak in generalities, but we
pay for that flexibility. Our errors are harder to trace to their origins.
While the Clojure compiler can warn us of some errors, like mis-spelled
variable names, it cannot (without a library like core.typed) tell us when we
have incorrectly assumed an object will be of a certain type. Even very rigid
languages, like Haskell, cannot identify some errors, like reversing the
arguments to a subtraction function. Some tests are always necessary, though
types are a huge boon.

No matter what language we write in, we use a balance of types and tests to
validate our assumptions, both when the program is compiled and when it is run.

The errors that arise in compilation or runtime aren’t rebukes so much as
hints. Don’t despair! They point the way towards understanding one’s program in
more detail–though the errors may be cryptic. Over time we get better at
reading our language’s errors and making our programs more robust.
