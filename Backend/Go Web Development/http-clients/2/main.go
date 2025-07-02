package main

import (
   "fmt"
   "log"
  )

const postsURL = "https://jsonplaceholder.typicode.com/posts"

func main() {
    posts, err := getPostsData(postsURL)
    if err != nil {
       log.Fatalf("error getting posts data: %v", err)
    }


    prettyData, err := prettify(string(posts))
    if err != nil {
       log.Fatalf("error prettifying data: %v", err)
    }

    fmt.Println(prettyData)
}
