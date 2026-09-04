package main

import (
	"fmt"
	"io"
	"net/http"
)

const usersUrl = "https://api.boot.dev/v1/courses_rest_api/learn-http/users"

func main() {
	users, err := getUserData(usersUrl)
	if err != nil {
		fmt.Println(err)
		return
	}

	fmt.Println(string(users))
}

func getUserData(url string) ([]byte, error) {
	res, err := http.Get(url)
	if err != nil {
		return nil, fmt.Errorf("error making request: %w", err)
	}

	defer res.Body.Close()

	data, err := io.ReadAll(res.Body)

	if err != nil {
		return nil, fmt.Errorf("error reading response: %w", err)
	}

	return data, nil
}
