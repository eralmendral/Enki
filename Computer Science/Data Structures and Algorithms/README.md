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

![image](https://github.com/user-attachments/assets/6611c7af-e2de-43d9-b723-7446003449d3)


As the size of inputs grows, the algorithms become slower to complete (take longer to run). The rate at which they become slower is defined by their Big O category.

For example, O(n) algorithms slow down more slowly than O(n^2) algorithms.

| Big-O     | Name         | Description |
|-----------|--------------|-------------|
| O(1)      | constant     | **Best** – The algorithm always takes the same amount of time, regardless of how much data there is. Example: Looking up an item in a list by index |
| O(log n)  | logarithmic  | **Great** – Algorithms that remove a percentage of the total steps with each iteration. Very fast, even with large amounts of data. Example: Binary search |
| O(n)      | linear       | **Good** – 100 items, 100 units of work. 200 items, 200 units of work. This is usually the case for a single, non-nested loop. Example: Unsorted array search |
| O(n log n)| "linearithmic" | **Okay** – Slightly worse than linear, but not too bad. Example: mergesort and other "fast" sorting algorithms |
| O(n²)     | quadratic    | **Slow** – The amount of work is the square of the input size. 10 inputs, 100 units of work. 100 inputs, 10,000 units of work. Example: A nested for loop to find all ordered pairs in a list |
| O(n³)     | cubic        | **Slower** – If you have 100 items, this does 100³ = 1,000,000 units of work. Example: Triple nested for loop for all ordered triples in a list |
| O(2ⁿ)     | exponential  | **Horrible** – Avoid at all costs. Adding one to the input doubles the amount of steps. Example: Brute-force guessing results of n coin flips |
| O(n!)     | factorial    | **Even More Horrible** – Becomes so slow so fast that it’s practically unusable. Example: Generating all permutations of a list |

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

```python
def binary_search(target, arr):
    low = 0
    high = len(arr) - 1
    while low <= high:
        median = int((low + high) / 2)
        if arr[median] == target:
            return True
        elif arr[median] < target:
            low = median + 1
        else:
            high = median - 1
    return False 
```

<br>
<hr />

# Sorting Algorithms
>Almost every action you take in a web app relies on sorted data. Just looking up a user's profile in a database likely relies on a sorted index (which we'll talk about in another course).

- Fortunately, most programming languages provide their own standard sorting implementation. In Python, for example, we can use the sorted function:

```python
items = [1, 5, 3]
print(sorted(items)) # [1, 3, 5]
```

## Bubble Sort
> is a very basic sorting algorithm named for the way elements "bubble up" to the top of the list.
> Bubble sort repeatedly steps through a slice and compares adjacent elements, swapping them if they are out of order. It continues to loop over the slice until the whole list is completely sorted. Here's the pseudocode:
- Set **swapping** to True
- Set **end** to the length of the input list
- While **swapping** is True
   - Set **swapping** to False
   - For **i** from the 2nd element to end:
     - If the **(i-1)** th element of the input list is greater than the **i** th element:
        - Swap the **(i-1)** th element and the **i** th element
        - Set **swapping** to True
      - Decrement **end** by one
- Return the sorted list.


<hr/>

Introduction to Data Structures

> Data structures are just organizational tools that allow for more advanced algorithms.
> A data structure is a data organization, management and storage format that enables efficient access and modification.
> A collection of data values, the relationship among them, and the functions or operations that can be applied to the data.

- Stores Data
- Organizes data so it can be easily accessed and modified
- Contains the algorithmic function to expose the ability to read and modify the data.

- Some examples:

1. Stacks - Last In, First Out (LIFO)
2. Queues - First In, First Out (FIFO)
3. Linked Lists - Chain of nodes, efficient for insert and deletes.
4. Binary Trees - A tree where each node has up to 2 children.
5. Red Black - A self balancing binary tree using colors.
6. Hash Maps - A data structure that maps keys to values
7. Tries - A tree used for storing and searching words efficiently
8. Graphs - A collection of nodes connected by edges.


### List: An ordered collection of items
```python
animals = ['cat', 'dog', 'mouse']
```

### Dictionary: Collections of key/value pairs
```python
car = {
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}
```

