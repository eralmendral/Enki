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
 - go help
   - go help env
   - go help environment