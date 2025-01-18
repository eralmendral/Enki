### Concurrency & Parallelism
 - Concurrency and parallelism are related but distinct concepts in programming.
 - Concurrency refers to code that is written in a concurrent design pattern. This means that the code has the potential ability to execute multiple tasks simultaneously, where each task may make progress independently of the others.
    - In Go, concurrency is achieved using goroutines, lightweight threads of execution that are managed by the Go runtime.
    - A Go program can create many goroutines that can run concurrently, each performing a different task.
    - The communication and synchronization of these goroutines is typically done using **channels**, which provide a way for goroutines to exchange data and coordinate their execution.

 - Parallelism - refers to the ability of the program to execute multiple tasks simultaneously by utilizing multiple CPUs or cores.
   - 

