package main

import "fmt"

func main() {
   a := [3]int{1,2,3}
	
   fmt.Println(a) 
   
   fmt.Printf("%T is the type of %v", a,a)
}
