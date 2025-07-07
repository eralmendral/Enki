package main

import (
	"fmt"
	"net/http"
	"encoding/json"
)

func getTodos(url string)([]Todo, error) {
   res, err := http.Get(url)
   if err != nil {
	 return nil, fmt.Errorf("error creating request: %w", err) 
    }

    defer res.Body.Close()

    var todos: 

}
