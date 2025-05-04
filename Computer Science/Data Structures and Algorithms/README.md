# Data-Structures and Algorithms

Welcome to Data Structures and Algorithms
The terms "data structures" and "algorithms" were designed to scare young CS students into eating their vegetables. After this course, you'll come to see there is nothing to fear.

## Goals of This Course
- Learn to think algorithmically. Break problems down into easier-to-solve parts.
- Learn to think about how to organize data for more efficient access. Break problems down into data models that make sense.
- Learn and practice performance optimization. Make your code run faster and more efficiently, even with more data.

### What Is a Data Structure?
> Data structures are just organizational tools that allow for more advanced algorithms. You're already familiar with some of the simplest data structures:

- Lists: Ordered collections of data
- Dictionaries: Key -> value mappings
- Sets: Unordered collections of unique data
In this course we'll be exploring when you should use each of these, but we'll also cover more advanced structures like stacks, queues, and trees.

### What Is an Algorithm?
> An "algorithm" is just a set of instructions that can be carried out to solve a problem. People use algorithms all the time without even realizing it. Practically every function you write in code is an algorithm (well, kinda), even if it's a simple one.

We are going to start by focusing on algorithms, then move onto data structures. While it may sound complicated, you'll be introduced to these concepts step by step.

A Word of Warning
Don't worry about memorizing this stuff. In particular, don't worry about memorizing the algorithms and data structures themselves. My philosophy is that it's mostly a waste of time to memorize anything that's a Google search away.

Instead, focus on understanding how DSA works at the moment. You should understand what your code is doing and why - but that doesn't mean you need to memorize the code itself.


<hr />

an "algorithm" is just a set of instructions that can be carried out to solve a problem.

It's not anymore magical than that.


<hr />

### Exponents
- How many times a number is multipled to itself.
- 2 ^ 3 = 8
- 2 * 2 * 2 = 8
- exponent = 3

### Logarithms
- Inverse of exponents.
- What number to multiply a number to itself?
- 2 ^ 3 = 8
- log2(8) = 3
  

### Factorials
- Product of all integers less than & equal to **n**.
  


<hr />



## Big O Notation

- [Watch Video Here](https://storage.googleapis.com/qvault-webapp-dynamic-assets/lesson_videos/big-o-notation-v1-23-00-x264.mp4)

- There are a lot of existing algorithms; some are fast and some are slow. Some use lots of memory. It can be hard to decide which algorithm is the best to solve a particular problem.


- **Big O** analysis (pronounced "Big Oh") is one way to compare the practicality of algorithms by classifying their **[Time Complexity](https://en.wikipedia.org/wiki/Time_complexity)**.

- Where formula describes how an algorithm's run time or space requirements grow as the input size grows.
- O(1) - constant
- O(n) - linear
- O(n^2) - squared
- O(2^n) - exponential
- O(n!) - factorial


### The following chart shows the growth rate of several different Big O categories. The size of the input is shown on the x axis and how long the algorithm will take to complete is shown on the y axis.

[Big O Cheatsheet](https://www.bigocheatsheet.com/)

![image](https://github.com/user-attachments/assets/285db65c-f0c9-4413-ac57-b7df9d277edb)

As the size of inputs grows, the algorithms become slower to complete (take longer to run). The rate at which they become slower is defined by their Big O category.

For example, O(n) algorithms slow down more slowly than O(n^2) algorithms.
