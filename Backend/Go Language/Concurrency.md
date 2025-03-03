
### Concurrency & Parallelism
- Concurrency and parallelism are related but distinct concepts in programming.
- **Concurrency** refers to code that is written in a concurrent design pattern. This means that the code has the potential ability to execute multiple tasks simultaneously, where each task may make progress independently of the others.
  - In Go, concurrency is achieved using goroutines, lightweight threads of execution that are managed by the Go runtime.
  - A Go program can create many goroutines that can run concurrently, each performing a different task.
  - The communication and synchronization of these goroutines is typically done using **channels**, which provide a way for goroutines to exchange data and coordinate their execution.
- **Parallelism** refers to the ability of the program to execute multiple tasks simultaneously by utilizing multiple CPUs or cores.
  - Speed up the execution of a program by allowing multiple parts of the program to run in parallel on different processors. In Go, parallelism can be achieved by running multiple goroutines on different processors using the `go` keyword.
  - **serial / sequential execution**
    - the opposite of parallel computing
    - the opposite of code running in parallel is code running serially / sequentially.
    - In sequential execution, each instruction or task is executed one after the other in a predefined order, so that each instruction must wait for the previous one to finish before it can start. This differs from parallel execution, where multiple instructions or tasks can be executed simultaneously.
    - Sequential execution is typically used when the instructions or tasks are dependent on each other, or when the resources required to execute the code are limited. 
    - Parallel execution, on the other hand, is used to speed up the execution of code by running multiple instructions or tasks at the same time, often on multiple processors or cores.
  - Go makes it easy to write concurrent code using goroutines and channels.
