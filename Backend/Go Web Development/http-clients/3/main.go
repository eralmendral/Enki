package main

import(
	"fmt"
	"net/http"
	"log"
	"io"
)


const todosURL = "https://jsonplaceholder.typicode.com/todos"

func main() {
	todos, err := getTodos(todosURL)
	if err != nil {
	   log.Fatalf("error getting todos: %v", err)
	}

	fmt.Println(string(todos))

}

func getTodos(url string)([]byte, error) {
    res, err := http.Get(todosURL)
    if err != nil {
	    return nil, fmt.Errorf("error making request %w:", err)	         }

    defer res.Body.Close()
  
    data, err := io.ReadAll(res.Body)

    if err != nil {
       return nil, fmt.Errorf("error reading response: %w", err)
    } 
	
    return data, nil

}
