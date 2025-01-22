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



  
