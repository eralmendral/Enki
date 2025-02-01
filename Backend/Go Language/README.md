https://go.dev/doc/

- efficient compilation
- efficient execution
- ease of programming

- Build by Google



### Timeline
 - 2005 - first dual core processors
 - 2006 - Go development started
 - 2009 - open sourced (November)
 - 2012 - version 1



### Terminologies
- Concurrency
   - design pattern, "you write code with concurrency design pattern"
   - and when you run that code in machines with multiple cores, that code can run in "parallel"
     
- Parallelism - running code on multiple cores in parallel.



### Running Go Programs
 - go mod init <some_name>
 - create go file
 - package main
   - folders are packages
   - every file in a folder/package must have the same package name
 - func main
   - dot notation
      - package.function
   - CAPITALIZATION
      - Visible outside package
      - not visible outside package
   - semi-colons;
      - added by compiler
 - Running code
   - vs code / run
      - view / debug console
   - command line
      - go run main.go
         - go run ./...
         - builds executable and runs it
      - go build
         - builds executable
 
 - Cross build / compile
      - see environment variables
         - go env GOARCH GOOS
         - run one of these at the command line to build to a certain OS:
            - GOOS=darwin god build
            - GOOS=linux go build
            - GOOS=windows go build

 - Go install puts binary in $GOPATH/bin
   - go install
   - $GOPATH 

 - go help
   - go help env
   - go help environment



### Hash, Encryption, Communication
  > A Hash algorithm is a mathematical function that takes in a variable-sized input, such as a file or message, and produces a fixed-size output, known as a hash or digest.
      
  - The output is a unique representation of the input data, and even a small change to the input data will produce a completely different has value.
      - are used in a variety of applications such as data integrity cheks, message authentication, password storage, and digital signatures.
      - Example: 
         - When a user sets a password, the password is hashed and stored in a database.
         - When the user logs in, the password they enter is hased again and compared to the stored hash to verify their identity.
      - Are designed to be *one way* functions, meaning it is extremely difficult (if not impossible) to reconstruct the original input data from the has value.
      - This makes them useful for securely storing passwords or sensitive information. Common examples of hash algorithms include MD5, SHA-1, SHA-2, and SHA-3. 
      - However, it is important to note that some of thes algorithms, particularly MD5 an SHA-1, are considered insecure and should not be used for new applications.



  
  > Encryption
   - synchronous / symmetric encryption
      - single key
   - asynchronous encryption
      - public / private key




### "Most people overestimate what they can do in a year, and they underestimate what they can do in ten tears" - Bill Gates

### "Take the time learning everyday, little by little."

## Terminology  [12]
- declare - declare a variable to hold a Value of a certain Type
  - var x int

- assign - assign a value to a variable
  - var x int = 10

- initialize - declare & assign an initial value to a variable
  - var y int 
  - y = 10

- identifier - name of the variable

- keywords - reserved words built in language, and cannot be used.

- operator - character that represents an action
  - 2 + 2 // + is the operator
  - "2"s are the operands


- statement - smallest standalone element of a program that expresses some action be carried out.
  - is an instruction that commands the computer to perform a specified action.
  - A program is formed by a sequence of one or more statements.
  - Made of expressions


- expression - a value, or operations (operands and operators) that express a value.
 - a combination of one or more explicit values, constants, variables, operators, and functions that the programming language interprets and computes to produce another value.
 - Example:  2 + 8 is an expression which evaluates to 10.
 - x:= 2+ 8 
 - y:= 99  // 99 here is also an expression as it's a value.


- parens  - ( )

- curly braces "curlies"  - {  } 

- brackets - [  ]

- scope - area where variable exists and is accessible
  - best practice is to keep scope as narrow as possible.

<hr >


## Scope





- In some language, they use 'casting', but go not use 'casting', it use 'conversion'.
- Conversion - convert one data type to another. Compiler or interpreter automatically converts a data type to another.
- Casting - programmer manually converts a data type to another. Also known as 'forcing' a vlaue from one type to another.

- https://www.geeksforgeeks.org/type-casting-or-type-conversion-in-golang/



### Data Types

- We Declare a variable of a certain type
- go is  a statically typed

- basic type / built-in type / primitive type
  - data type provided by a programming language as a basic building block.
  - Most languages allow more complicated composite types to be constructed starting from basic types
  - In most programing languages, all basic data types are built-in
  - https://pkg.go.dev/builtin@go1.23.4


- aggregate types
 - may values together
 - array, slice, struct
 - composite / compound / structure / struct type
  - include values of different types
 - act of constructing a STRUCT which is a composite type is known as composition



 ## Numeral Systems


### Decimal

  - base 10

  - ten millions, millions, hundred thousands, ten thousands, thousands, hundreds, tens, ones
  - 4 2 0
  - 4 x 100,  2 x 10 , 0 x 1 
  - 420
  - 10 ^ 2,  10 ^ 1 , 10 ^ 0
  



### Binary
  - base 2   // 0 and 1 only
  - one twenty eights |  sixty fours | thirty twos | sixteens | eights | fours | twos | ones
  - 2 ^ 7 | 2 ^ 6 | 2 ^ 5 |  2 ^ 4 |  2 ^ 3  | 2 ^ 2 | 2 ^ 1  | 2 ^ 0
  -   0       0      0        0        1         0       1         0
  - 10



### Hexa
  - base 16
  - 65536   |    4096       |    256       |  16       | ones
  - 16 ^ 4  |  16 ^  3   |     16 ^  2 |     16 ^  1   |  16 ^  0 
  -    0     |    0       |  3           |     8        | f
  - 16 -> 0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f
  -                         ( 3 * 256) +  (8 * 16) + (16 * f)
  - 911

  

### Dependency Management

 > is the process of identifying, organizing and resolving the external code libraries and packages that a software application or project depends upon. Most software applications depend on a large number of external code libraries or packages, which are maintained by third-party developers.
 
 > Dependency management is important because it ensures that all required libraries and packages are available and compatible with each other and that any updates or changes to those dependencies are managed and controlled to prevent issues that could arise due to **conflicting versions** or changes.

 > There are various tools and techniques for managing dependencies in programming, including package managers such as **npm** for Node.js, **pip** for Python and **Maven** for Java. These tools allow developers to easily install, update and remove external dependencies for their projects, and also provide features like version control, dependency resolution, and automatic updates.


 > A module is a piece of code that may be built upon, a package is a collection of modules, a library is a collection of pre-written code, and a framework is a set of principles for developing applications.

 - In go we create modules
  - go mod init
 - Modules have packages
 - namespacing  - [domain,repo]
 - go mod tidy
 

### Spaghetti Code
 > Spaghetti code refers to a programming code that is complex, tangled and difficult to understand and maintain. The term spaghetti code is often used to describe code that has been written in haphazard and unstructured manner making it difficult for other programmers to understand and modify the code.
 > It typically arises when the programmer does not follow a structured approach to software development and fails to organize the code into modular, reusable components. This can lead to software that is unreliable, inefficient, and prone to errors.
 > The term "spaghetti code" is derived from the visual appearance of the code, which resembles a tangled mess of lines that are difficult to trace and follow, similar to a plate of spaghetti.
 > To avoid spaghetti code, it is important for programmers to follow best practices for software development, such as structured approach, creating modular components, and documenting their code thoroughly.



### Modular Code / Structured Programming
 > A **structured approach** to software development is a methodical and organized approach to writing software code. It involves breaking down a large softwware project into smaller, manageable tasks, and approach is to make the code more readable, maintanable and scalable, which helps to reduce errors and improve software quality.
 


 ### Steps

 > go mod init <module_url>


 ### Control Flow
  - if statements
  - switch statements
  - comparison operators
  - logical operators
  - statement;statement idiom
  - comma,ok idiom
  select statement fro concurrency communication
  - 


 ### Array & Slice


 ### Map


 ### Structs


 ### Functions


 ### Pointers 


 ### Generics


 ### Concurrency

 
 ### Channels


 ### Error Handling


 ### Go Idioms

 - Statement;statement
 - Comma,ok



### Variables, Zero Values, Blank Identifier

- Go is a static typed language, not dynamic
- A variable hold a value with specific type
  - var num int = 10
- Declare   ->   var num
- Assign a value  -> var num int = 10
- Short declaration -> Declare and Assign a value ->   num := 10  // declare var num, auto type to 'int' with value 10
- Multiple assignments -> a,b,c := 0, 1, 'test'
- Blank identifer ->  _   // no return 
  _ := 3 

### Printf for Decimals & Hexadecimals
 

### Scope
 - package block scope
 - block scope



### Working at the terminal
 - GUI = Graphical User Interface
 - CLI = Command Line Interface
 - Two Flavors of Computers
  - Unix/Linux/Mac
    - shell , bash , terminal
  - Windows
    - command prompt, windows command, cmd , dos prompt


### Permission Group
 - d = directory
 - r = read 
 - w = write 
 - x = execute
 - rwxrwxrwx = owner, group, world
  - Example : "drwxr-xr-x+" -> directory | owner can [read, write, exec] | group can [read, exec] | world can [read, write, exec]
 - Giving Permissions
  - r - 4
  - w - 2
  - x - 1
  - chmod 777 notes.txt  -> owner (7) | group(4) | world (4)
  - owner can "rwx" -> 4 + 2 + 1 -> 7
  - group can "r--" -> read only  -> 4 
  - world can "r--" -> read only -> 4


### Concurrency & Parallelism
 - Concurrency and parallelism are related but distinct concepts in programming.
 - Concurrency refers to code that is written in a concurrent design pattern. This means that the code has the potential ability to execute multiple tasks simultaneously, where each task may make progress independently of the others.
    - In Go, concurrency is achieved using goroutines, lightweight threads of execution that are managed by the Go runtime.
    - A Go program can create many goroutines that can run concurrently, each performing a different task.
    - The communication and synchronization of these goroutines is typically done using **channels**, which provide a way for goroutines to exchange data and coordinate their execution.

   - Parallelism - refers to the ability of the program to execute multiple tasks simultaneously by utilizing multiple CPUs or cores.
   - Speed up the execution of a program by allowing multiple parts of the program to run in parallel on different processors. In Go, parallelism can be achieved by running multiple goroutines on different processors using the go keyword.
      - serial / sequential execution
         - the opposite of parallel computing
         - the opposite of code running in parallel is code running serially / sequentially.
         - In sequential execution, each instruction or task is executed one after the other in a predefined order, so that each instruction must wait for the previous one to finish before it can start. This differs from parallel execution, where multiple instructions of tasks can be executed simultaneously.
         - Sequential execution is typically used when the instructions or tasks are dependent  on each other, or when the resources required to execute the code are limited. 
         - Parallel execution on the other hand, is used to speed up the execution of code by running multiple instructions or tasks at the same time, often on multiple processors or cores.
   - Go makes it easy to write concurrent code using goroutines and channels.

   


----


- Why the power symbols looks like the power symbol
- 0s and 1s combined 'icon'


### Core Principles
- Computers run on electricity.
- Electricity has 2 discrete state. On and Off
- We can create coding scheme for 'on and off' states'
  - Example: Morse code, Halloween trick or treat / go away.

- 2 ^ n
- 0 - off
- 1 - on
- Power icon -> 0 and 1 combined / off and one.


before the ASCII, different countries or places has different way of representing coding scheme for 0s and 1s.

### ASCII
- One evolution that the computers has gone through is the standardization of coding scheme.
- Western Centric
- 1 Byte - 8bits
- Bit - is a Binary Digit
- Bi - two, 0 and 1
- ASCII use 1 byte for 8bit
- 8 on and off state
- ASCII didn't have the all the characters in all languages of the world. Then Unicode is created.


### Unicode
- Unicode includes ASCII
- more than enough to account for every character in every language
- 2 ^ 34 (4 bytes) = 4,294,967,296 values

### UTF 8
- up to 4 bytes
- Stores Unicode as binary
- If a character needs 1 byte that's all it will use.
- If a character needs 4 bytes it will use 4 bytes.
- Variable length encoding -  efficient memory use 
- common character like 'C' takes 8 bits
- rare character like '❤️' takes 32bits
- other characters takes 16 or 24 bits.

// read more here: https://blog.hubspot.com/website/what-is-utf-8
