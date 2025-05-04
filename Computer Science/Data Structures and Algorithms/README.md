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



<hr />

## O(n) - Order "n"
 - O(n) is very common - When the number of steps in an algorithm grows at the same rate as its input size, it's classified as O(n).

For example, our find min algorithm from earlier is O(n):

- Set min to positive infinity.
- For each number in the list, compare it to min. If it is smaller, set min to that number.
min is now set to the smallest number in the list.
- The input to the find min algorithm is a list of size n. Because we loop over each item in the input once, we add one step to our algorithm for each item in our list.
- As we use find min with larger and larger inputs, the length of time it takes to execute the function grows at a steady linear pace. We can reasonably estimate the time it will take to run, based on a previous measurement. If we find that:

| Input size	| Time to run |
| --------------| -------------- |
| find_min(10 items)	| 2 ms | 

Then we can estimate the following:

| Input size	 | Time to run | 
| ----------   | ---------- |
| find_min(100 items)  |	20 ms |
| find_min(1000 items)	| 200 ms |
| find_min(10000 items)	| 2000 ms | 


<hr />

## O(n^2) - Order “N Squared”

> O(n^2) grows in complexity much more rapidly. That said, for small and medium input sizes, these algorithms can still be very useful.

> A common reason an algorithm falls into O(n^2) is by using a nested loop, where the number of iterations of each loop is equal to the number of items in the input:

```python
for person_one in persons:
    for person_two in persons:
        # every combination of people
        # will go on a date... twice!
        go_on_date(person_one, person_two)
```


<hr />

## O(nm)
> O(nm) is very similar to O(n ^ 2), but instead of a single input that we care about, there are two. If n and m increase at the same rate, then O(nm) is effectively the same as O(n ^ 2). However, if n or m increases fateror slower, then it's useful to track their complexity separately.


<hr />

## Constants Don't Matter

[Watch Video Here](https://storage.googleapis.com/qvault-webapp-dynamic-assets/lesson_videos/why-constants-dont-matter.mp4)

Big-O notation only describes the theoretical growth rate of algorithms. It doesn't deal with the actual time an algorithm takes to run on a given machine. As such, when doing Big O analysis, we don't let ourselves get bogged down in details.


For example, take a look at the following functions:

```python
def print_names_once(names):
    for name in names:
        print(name)
```

```python
def print_names_twice(names):
    for name in names:
        print(name)
    for name in names:
        print(name)
```

- As you would expect, print_names_once will take half the time to run as print_names_twice. And in the real world of software engineering, cutting speed in half is awesome. The funny thing about Big O analysis is that we don't care.

- Both of the functions above have the same rate of growth, O(n). You might be tempted to say, "print_names_twice should be O(2 * n)" but you would be missing the whole point of Big O.

- In Big O analysis we drop all constants because while they affect the runtime, they don't affect the change in the runtime.
- O(2 * n) -> O(n)
- O(10 * n^2) -> O(n^2)


<hr />

## Order 1
> O(1) means that no matter the size of the input, there is no growth in the runtime of the algorithm. This is also referred to as a "constant time" algorithm.
> In Python, a dictionary offers the ability to look items up by key, which is an operation that is independent of the size of the dictionary:

```python
# this is a constant time lookup
org = organizations[org_id]
```

<hr />

## Order Log N
> O(log(n)) algorithms are only slightly slower than O(1), but much faster than O(n). They do grow according to the input size, n, but only according to the log of the input.

- O(n):

  
| n | time |
---- | -------|
| 8 | 8ms |
| 64 | 64ms |
| 1024 | 1024ms |
| 1048576 | 1048576ms |


- O(log(n)):

| n | time |
|---- | ----- |
| 8 | 3ms |
| 64 | 6ms |
| 1024 | 10ms |
| 1048576 | 20ms |


### Binary Search
![image](https://github.com/user-attachments/assets/79baad50-172c-4534-ae59-ac18f94244c8)

- A binary search algorithm is a common example of an O(log(n)) algorithm. Binary searches work on a pre-sorted list of elements.

- Pseudocode
- Given two inputs:
  1. A list of n elements sorted from least to greatest
  2. A target value:

 - Do the following:
   1. Set low = 0 and high = n - 1.
   2. While low <= high:
    - Set median (the position of the middle element) to (low + high) // 2, which is the greatest integer less than or equal to (low + high) / 2
    - If list[median] == target, return True
    - Else if list[median] < target, set low to median + 1
    - Otherwise set high to median - 1
   3. Return False

> At each iteration of loop, we halve the list. Which makes the algorithm O(log(n)). In other words, to add one more step to the runtime, we'd have to double the size of the input. Binary searches are fast.
