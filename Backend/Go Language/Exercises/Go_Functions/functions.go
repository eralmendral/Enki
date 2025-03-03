package main

import "fmt"

func main() {
	foo()
	bar("Gon")
}

func foo() {
	fmt.Print("hello from foo")
}

func bar(s string) {
	fmt.Printf("Hello %s from bar.", s)
}
