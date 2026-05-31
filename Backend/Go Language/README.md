# Go Language Tutorial

https://go.dev/doc/

## What is Go?

Go is a programming language that is:
- **Fast and lightweight** - small memory footprint, efficient execution
- **Concurrent** - built-in support for concurrent programming with goroutines and channels
- **Easy and simple** - clean syntax, ease of programming
- **Compiled** - produces standalone executables
- **Statically typed** - types are checked at compile time
- **Garbage collected** - automatic memory management

Built by Google.

### Timeline
- 2005 - first dual core processors
- 2006 - Go development started
- 2009 - open sourced (November)
- 2012 - version 1

---

## Tutorial Topics

### Fundamentals
- [Variables](./Go-Fundamentals/Variables.md) - declarations, types, constants
- [Conditionals](./Go-Fundamentals/Conditionals.md) - if, switch, comparison operators
- [Loops](./Go-Fundamentals/Loops.md) - for, range
- [Functions](./Go-Fundamentals/Functions.md) - named returns, anonymous functions
- [Errors](./Go-Fundamentals/Errors.md) - error handling

### Data Structures
- [Slices](./Go-Fundamentals/Slices.md) - dynamic arrays
- [Maps](./Go-Fundamentals/Maps.md) - key-value pairs
- [Structs](./Go-Fundamentals/Structs.md) - custom types, composition
- [Interfaces](./Go-Fundamentals/Interfaces.md) - polymorphism

### Advanced
- [Pointers](./Go-Fundamentals/Pointers.md) - memory addresses
- [Generics](./Go-Fundamentals/Generics.md) - type parameters
- [Packages](./Go-Fundamentals/Packages.md) - modules and dependencies
- [Channels](./Go-Fundamentals/Channels.md) - goroutine communication
- [Mutexes](./Go-Fundamentals/Mutexes.md) - synchronization
- [Concurrency](./Concurrency.md) - goroutines and parallelism

---

## Running Go Programs

### Setup
- `go mod init <module_name>` - initialize module
- Create `.go` file with `package main`

### Package Structure
- Folders are packages
- Every file in a folder/package must have the same package name
- `func main` - entry point
- CAPITALIZATION: `Exported` (visible) vs `unexported` (private)
- Semi-colons: added by compiler

### Commands
```bash
go run main.go       # compile and run
go run ./...         # run all files
go build             # compile to executable
go install           # put binary in $GOPATH/bin
go help              # help
```

### Cross Compilation
```bash
go env GOARCH GOOS   # see environment
GOOS=darwin go build
GOOS=linux go build
GOOS=windows go build
```

---

## Concepts

### Concurrency vs Parallelism
- **Concurrency** - design pattern for code that can handle multiple tasks
- **Parallelism** - actually running code on multiple cores simultaneously

### Compiled vs Interpreted
Compiled programs produce standalone executables. You don't need the compiler or source code to run them.

| Compiled | Interpreted |
|----------|-------------|
| Go, C, C++, Rust | Python, Ruby, JavaScript |
| Faster execution | Requires interpreter |
| Standalone binary | Needs source code |

### What is Statically Typed?
In statically typed languages, variable types are determined at compile time. The compiler checks type correctness before the program runs.

```go
var age int = 25      // type declared explicitly
name := "Go"          // type inferred at compile time
age = "hello"         // compile error - can't assign string to int
```

---

## Reference

### Hash, Encryption, Communication
> A Hash algorithm is a mathematical function that takes in a variable-sized input, such as a file or message, and produces a fixed-size output, known as a hash or digest.

- The output is a unique representation of the input data, and even a small change to the input data will produce a completely different hash value.
  - used in data integrity checks, message authentication, password storage, and digital signatures.
  - Example: 
    - When a user sets a password, the password is hashed and stored in a database.
    - When the user logs in, the password they enter is hashed again and compared to the stored hash to verify their identity.
  - designed to be *one way* functions, meaning it is extremely difficult (if not impossible) to reconstruct the original input data from the hash value.
  - useful for securely storing passwords or sensitive information. Common examples of hash algorithms include MD5, SHA-1, SHA-2, and SHA-3.
  - However, some of these algorithms, particularly MD5 and SHA-1, are considered insecure and should not be used for new applications.

> Encryption
- synchronous / symmetric encryption: single key
- asynchronous encryption: public / private key

### Quotes
> "Most people overestimate what they can do in a year, and they underestimate what they can do in ten years" - Bill Gates

> "Take the time learning everyday, little by little."

### Terminology
- **declare** - declare a variable to hold a Value of a certain Type
  - `var x int`
- **assign** - assign a value to a variable
  - `var x int = 10`
- **initialize** - declare & assign an initial value to a variable
  - `var y int`
  - `y = 10`
- **identifier** - name of the variable
- **keywords** - reserved words built in language, and cannot be used.
- **operator** - character that represents an action
  - `2 + 2` // + is the operator
- **statement** - smallest standalone element of a program that expresses some action to be carried out.
  - is an instruction that commands the computer to perform a specified action.
  - A program is formed by a sequence of one or more statements.
  - Made of expressions
- **expression** - a value, or operations (operands and operators) that express a value.
  - a combination of one or more explicit values, constants, variables, operators, and functions that the programming language interprets and computes to produce another value.
  - Example: `2 + 8` is an expression which evaluates to 10.
  - `x := 2 + 8`
  - `y := 99` // 99 here is also an expression as it's a value.
- **parens** - ( )
- **curly braces "curlies"** - { }
- **brackets** - [ ]
- **scope** - area where variable exists and is accessible
  - best practice is to keep scope as narrow as possible.

### Scope
- In some languages, they use 'casting', but Go does not use 'casting', it uses 'conversion'.
- **Conversion** - convert one data type to another. Compiler or interpreter automatically converts a data type to another.
- **Casting** - programmer manually converts a data type to another. Also known as 'forcing' a value from one type to another.
- https://www.geeksforgeeks.org/type-casting-or-type-conversion-in-golang/

### Data Types
- We declare a variable of a certain type
- Go is a statically typed language
- **basic type / built-in type / primitive type**
  - data type provided by a programming language as a basic building block.
  - Most languages allow more complicated composite types to be constructed starting from basic types
  - In most programming languages, all basic data types are built-in
  - https://pkg.go.dev/builtin@go1.23.4
- **aggregate types**
  - many values together
  - array, slice, struct
  - composite / compound / structure / struct type
  - include values of different types
  - act of constructing a STRUCT which is a composite type is known as composition

### Numeral Systems
#### Decimal
- base 10
- ten millions, millions, hundred thousands, ten thousands, thousands, hundreds, tens, ones
- 4 2 0
- 4 x 100, 2 x 10, 0 x 1
- 420
- 10 ^ 2, 10 ^ 1, 10 ^ 0

#### Binary
- base 2 // 0 and 1 only
- one twenty-eighths | sixty-fours | thirty-twos | sixteens | eights | fours | twos | ones
- 2 ^ 7 | 2 ^ 6 | 2 ^ 5 | 2 ^ 4 | 2 ^ 3 | 2 ^ 2 | 2 ^ 1 | 2 ^ 0
- 0 0 0 0 1 0 1 0
- 10

#### Hexadecimal
- base 16
- 65536 | 4096 | 256 | 16 | ones
- 16 ^ 4 | 16 ^ 3 | 16 ^ 2 | 16 ^ 1 | 16 ^ 0
- 0 | 0 | 3 | 8 | f
- 16 -> 0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f
- (3 * 256) + (8 * 16) + (16 * f)
- 911

### Dependency Management
> is the process of identifying, organizing, and resolving the external code libraries and packages that a software application or project depends upon. Most software applications depend on a large number of external code libraries or packages, which are maintained by third-party developers.

> Dependency management is important because it ensures that all required libraries and packages are available and compatible with each other and that any updates or changes to those dependencies are managed and controlled to prevent issues that could arise due to **conflicting versions** or changes.

> There are various tools and techniques for managing dependencies in programming, including package managers such as **npm** for Node.js, **pip** for Python, and **Maven** for Java. These tools allow developers to easily install, update, and remove external dependencies for their projects, and also provide features like version control, dependency resolution, and automatic updates.

> A module is a piece of code that may be built upon, a package is a collection of modules, a library is a collection of pre-written code, and a framework is a set of principles for developing applications.

- In Go we create modules
  - `go mod init`
- Modules have packages
- namespacing - [domain, repo]
- `go mod tidy`

### Spaghetti Code
> Spaghetti code refers to programming code that is complex, tangled, and difficult to understand and maintain. The term spaghetti code is often used to describe code that has been written in a haphazard and unstructured manner, making it difficult for other programmers to understand and modify the code.

> It typically arises when the programmer does not follow a structured approach to software development and fails to organize the code into modular, reusable components. This can lead to software that is unreliable, inefficient, and prone to errors.

> The term "spaghetti code" is derived from the visual appearance of the code, which resembles a tangled mess of lines that are difficult to trace and follow, similar to a plate of spaghetti.

> To avoid spaghetti code, it is important for programmers to follow best practices for software development, such as a structured approach, creating modular components, and documenting their code thoroughly.

### Modular Code / Structured Programming
> A **structured approach** to software development is a methodical and organized approach to writing software code. It involves breaking down a large software project into smaller, manageable tasks, and the approach is to make the code more readable, maintainable, and scalable, which helps to reduce errors and improve software quality.

### Steps
> `go mod init <module_url>`

### Go Idioms
- Statement;statement
- Comma, ok

---

## System Concepts

### Working at the Terminal
- GUI = Graphical User Interface
- CLI = Command Line Interface
- Two Flavors of Computers
  - Unix/Linux/Mac
    - shell, bash, terminal
  - Windows
    - command prompt, windows command, cmd, dos prompt

### Permission Group
- d = directory
- r = read 
- w = write 
- x = execute
- rwxrwxrwx = owner, group, world
  - Example: "drwxr-xr-x+" -> directory | owner can [read, write, exec] | group can [read, exec] | world can [read, write, exec]
- Giving Permissions
  - r - 4
  - w - 2
  - x - 1
  - `chmod 777 notes.txt` -> owner (7) | group(4) | world (4)
  - owner can "rwx" -> 4 + 2 + 1 -> 7
  - group can "r--" -> read only -> 4 
  - world can "r--" -> read only -> 4

### Core Principles
- Computers run on electricity.
- Electricity has 2 discrete states: On and Off
- We can create coding schemes for 'on and off' states
  - Example: Morse code, Halloween trick or treat / go away.
- 2 ^ n
- 0 - off
- 1 - on
- Power icon -> 0 and 1 combined / off and on

### ASCII
- One evolution that computers have gone through is the standardization of coding schemes.
- Western Centric
- 1 Byte - 8 bits
- Bit - is a Binary Digit
- Bi - two, 0 and 1
- ASCII uses 1 byte for 8 bits
- 8 on and off states
- ASCII didn't have all the characters in all languages of the world. Then Unicode was created.

### Unicode
- Unicode includes ASCII
- more than enough to account for every character in every language
- 2 ^ 34 (4 bytes) = 4,294,967,296 values

### UTF-8
- up to 4 bytes
- Stores Unicode as binary
- If a character needs 1 byte that's all it will use.
- If a character needs 4 bytes it will use 4 bytes.
- Variable length encoding - efficient memory use 
- common character like 'C' takes 8 bits
- rare character like '❤️' takes 32 bits
- other characters take 16 or 24 bits
- read more here: https://blog.hubspot.com/website/what-is-utf-8

