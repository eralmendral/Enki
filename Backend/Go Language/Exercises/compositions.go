package main

import "fmt"

type Engine struct {
	// some fields
}

type Car struct {
	Engine // embedding engine struct
	// Car - specific fields
}

func (e *Engine) Start() {
	fmt.Println("Engine started")
}

func main() {

	// Engine struct is embedded in Car struct
	// Car struct can access Engine struct's fields and methods
	car := Car{}
	car.Start()
}
