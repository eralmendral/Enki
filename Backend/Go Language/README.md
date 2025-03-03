https://go.dev/doc/

- efficient compilation
- efficient execution
- ease of programming
- Built by Google

### Timeline
- 2005 - first dual core processors
- 2006 - Go development started
- 2009 - open sourced (November)
- 2012 - version 1

### Terminologies
- **Concurrency**
  - design pattern, "you write code with concurrency design pattern"
  - when you run that code in machines with multiple cores, that code can run in "parallel"
- **Parallelism**
  - running code on multiple cores in parallel

### Running Go Programs
- `go mod init <some_name>`
- create go file
- `package main`
  - folders are packages
  - every file in a folder/package must have the same package name
- `func main`
  - dot notation: `package.function`
  - CAPITALIZATION
    - Visible outside package
    - not visible outside package
  - semi-colons: added by compiler
- Running code
  - VS Code / run
    - view / debug console
  - command line
    - `go run main.go`
    - `go run ./...` (builds executable and runs it)
    - `go build` (builds executable)
- Cross build / compile
  - see environment variables: `go env GOARCH GOOS`
  - run one of these at the command line to build to a certain OS:
    - `GOOS=darwin go build`
    - `GOOS=linux go build`
    - `GOOS=windows go build`
- `go install` puts binary in `$GOPATH/bin`
  - `go install`
  - `$GOPATH`
- `go help`
  - `go help env`
  - `go help environment`

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

### Control Flow
- if statements
- switch statements
- comparison operators
- logical operators
- statement;statement idiom
- comma, ok idiom
- select statement for concurrency communication

### Array & Slice
- Slice is built on top of an array

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
- Comma, ok

### Variables, Zero Values, Blank Identifier
- Go is a static typed language, not dynamic
- A variable holds a value with a specific type
  - `var num int = 10`
- Declare -> `var num`
- Assign a value -> `var num int = 10`
- Short declaration -> Declare and Assign a value -> `num := 10` // declare var num, auto type to 'int' with value 10
- Multiple assignments -> `a, b, c := 0, 1, 'test'`
- Blank identifier -> `_` // no return 
  `_ := 3`

### Type Sizes
- integers, uints, floats, complex
- Whole numbers (no decimals)
  - `int int8 int16 int32 int64`
- Positive numbers (unsigned)
  - `uint uint8 uint16 uint32 uint64 uintptr`
- Signed Decimals
  - `float32 float64`
- Imaginary Numbers
  - `complex64 complex128`

> The size (8, 16, 32, 64, 128, etc) represents how many bits in memory will be used to store the variable. The "default" int and uint types refer to their respective 32 or 64-bit sizes depending on the environment of the user.

> The "standard" sizes that should be used unless you have a specific performance need (e.g. using less memory) are:

```go
int
uint
float64
complex128
```

### Converting between types
```go
temperatureFloat := 88.26
temperatureInt := int64(temperatureFloat)
```

### Default Types
- `bool`, `string`, `int`, `uint`, `byte`, `rune`, `float64`, `complex128`

### When Should I Use a More Specific Type?
> When you're super concerned about performance and memory usage.
> That’s about it. The only reason to deviate from the defaults is to squeeze out every last bit of performance when you are writing an application that is resource-constrained. (Or, in the special case of `uint64`, you need an absurd range of unsigned integers).

### Printf for Decimals & Hexadecimals

### Scope
- package block scope
- block scope

### Working at the terminal
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

### Compiled vs Interpreted
> You can run a compiled program without the original source code. You don't need the compiler anymore after it's done its job. 

> That's how most video games are distributed! Players don't need to install the correct version of Python to run a PC game: they just download the executable game and run it.

> With interpreted languages like Python and Ruby, the code is interpreted at runtime by a separate program known as the "interpreter". Distributing code for users to run can be a pain because they need to have an interpreter installed, and they need access to the source code.

> Examples of Compiled Languages
- Go
- C
- C++
- Rust

> Examples of Interpreted Languages
- JavaScript (sometimes JIT-compiled, but a similar concept)
- Python
- Ruby

### Aggregate Types
- composed types
- data types that hold many values
- arrays, slices, maps, structs

### Arrays
- numbered sequence of elements of the **same** type.
- does not change in size.
- used for Go Internals; generally not used in your code.

### Slices
- build on top of array, hold values of the **same** type.
- changes in size, has a length and a capacity
- Topics:
  - for range
  - append -> `append(a, 4, 5, 6)`
  - slicing -> `a[1:4]`
  - deleting -> combination of append & slice
  - make
  - multidimensional slice

### Map
- key - value
- unordered group of values of one Type, called the element type, indexed

### Struct
- data structure
- composite / aggregate
- allow us to **collect values of different types together**
- Embedded structs
- **Composition**
  - refers to a way of structuring and building complex types by combining multiple simpler types. 
  - is one of the fundamental principles of OOP
  - Embedding one struct type within another.
  - Done by using structs

### Functions
  - Reusable, has name, can call
  - Named returns
  - Naked returns
  - Explicit returns
  - Early returns - guard clauses
  - Functions as values
  - Anonymous Functions


### Pointers
  - What are pointers?
    - To understand pointer, we have to understand a little bit about memory.
    - Computer and how memory works?
    - Why do we need memory when computing?
    - 2 + 1 
    - You need memory to store '2' , '+' , '1'
    - As computer receives input, they have to store it somewhere.
    - That's where memory comes.
    - A pointer is a variable that holds the memory address.
    - Allows you to directly manipulate memory.
  - How do computers' store stuff in memory.
  - There are different types of memory.
  - Memory = RAM
  - There are addresses where things are stored.
  - "&"  - gives us the address
  - "*"  - get the value stored at a memory address.
  - If p is a pointer to an integer then '*p' gives you the integer that 'p' points to.


   - Pointers are reference types
   - 


### Generics
  - https://go.dev/doc/tutorial/generics
  - type constraint
  - type set using interface
  - type alias and underlying constraints
  - Package constraints
    - https://pkg.go.dev/golang.org/x/exp/constraints
  - Concrete type vs Interface type
  