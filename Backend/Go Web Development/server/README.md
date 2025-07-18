
## TERMS
- Clients / Server Architecture
- To understand server we need to understand about TCP and HTTP 


### Web Programming Synonymous Terms
 - router
 - request router
 - multiplexer
 - mux
 - servemux
 - server
 - http router
 - http request router
 - http multiplexer
 - http mux
 - http servemux
 - http server



### Request & Response


### OSI
 - Open System Interconnection 

 - TCP
  - Transport
  - Transmission Control Protocol
  - Moving data back and forth
- HTTP
  - Protocol that runs on top of TCP
  - Written by IETF
  - Internet Engineering Task Force
    - They make recommendation on how the internet should be built.
    - Send Request For Comment RFC
    - https://www.ietf.org/rfc/rfc-index-latest.txt'


### Headers in Go's net/http Package
 - In Go, the net/http package provides us with the necessary tools to work with HTTP headers. We can access headers through the Header type, which is essentially a map of string slices (map[string][]string). This allows us to perform various actions on our request and response headers such as retrieving, setting, and removing them.
 ```go
// creating a new request
req, err := http.NewRequest("GET", "https://api.example.com/users", nil)
if err != nil {
	fmt.Println("error creating request: ", err)
	return
}

// setting a header on the new request
req.Header.Set("x-api-key", "123456789")

// making the request
client := http.Client{}
res, err := client.Do(req)
if err != nil {
	fmt.Println("error making request: ", err)
	return
}
defer res.Body.Close()

// reading a header from the response
header := res.Header.Get("last-modified")
fmt.Println("last modified: ", header)

// deleting a header from the response
res.Header.Del("last-modified")
 ```

 ```go
package main

import (
	"net/http"
)

func getContentType(res *http.Response) string {
	contentType := res.Header.Get("content-type")
	return contentType
}

 ```


<br>
<hr>

## Headers in Go's net/http Package
- In Go, the *net/http* package provides us with the necessary tools o work with HTTP headers. We can access headers through the *Header* type, which is essentially a map of string slices *(map[string][]string)*. This allows us to perform various actions on our request and response headers such as :
- retrieving, setting, and removing them.

```go
// creating a new request
req, err := http.NewRequest("GET", "https://api.example.com/users", nil)
if err != nil {
  fmt.Println("error creating request: ", err)
  return
}

// setting a header on the new request
req.Header.SET("x-api-key", "1234567890")


// making the request
client := http.Client{
req, err := client.Do(req)
if err != nil {
  fmt.Println("error making request: ", err)
  return
}

defer res.Body.Close()


// reading a header from the response
header := res.Header.Get("last-modified")
fmt.Println("last modified: ", header)

// deleting a header from the response
res.Header.Del("last-modified)








```


## Making a GET Request in GO
- There are two basic ways to make a Get request in Go.
1. The simple but less powerful way: [http.Get](https://pkg.go.dev/net/http#Get)
2. The verbose but more powerful way: [http.Client](https://pkg.go.dev/net/http#Client), [http.NewRequest](https://pkg.go.dev/net/http#NewRequest), and the [http.Client.Do](https://pkg.go.dev/net/http#Client.Do)

- If all you need to do is make a simple *GET* request to a URL, **http.GET** will work:
```go
 resp, err := http.Get("https://jsonplaceholder.typidcode.com/users)
```

- If you need to customize things like headers, cookies, or timeouts, you'll want to create a custom [http.Client](https://pkg.go.dev/net/http#Client), and [http.NewRequest](https://pkg.go.dev/net/http#NewRequest), then use the client's [Do](https://pkg.go.dev/net/http#Client.Do) method to execute it.

```go
client := &http.Client {
   Timeout: time.Second * 10,
}

req, err := http.NewRequest("GET", "https://jsonplaceholder.typicode.com/users", nil)
if err != nil {
   log.Fatal(err)
}
resp, err := client.Do(req)

```

## Decoding the JSON data

```go
package main

import (
 "encoding/json"
 "net/http"
)

func getUsers(url string)([]User, error) {
   res, err  := http.Get(url)
   if err != nil {
     return nil, err
   }
   defer res.Body.Close()
   
   var users []User


   decoder := json.NewDecoder(res.Body)
   err = decoder.Decode(&users)
   
   if err != nil {
     return nil, err
   }

   return users, nil

    
 

}

```

<br>
<hr>

## Post Request
```go
package main

import (
 "bytes"
 "encoding/json"
 "net/http"
 )

 func createUser(url, apiKey string data User)User, error) {
   
   
 }

```
