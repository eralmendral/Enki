# Ether
Networking

<hr />

- HTTP
- JSON
- DNS
- URIs
- Headers
- Methods
- Paths
- HTTPs
- Errors
- cURL
 
<hr />

Communicating on the Web
Instagram would be pretty terrible if you had to manually copy your photos to your friend's phone when you wanted to share them. Modern applications need to be able to communicate information between devices over the internet.

Gmail doesn't just store your emails in variables on your computer, it stores them on computers in their data centers
You don't lose your Slack messages if you drop your computer in a lake, those messages exist on Slack's servers
How Does Web Communication Work?
When two computers communicate with each other, they need to use the same rules. An English speaker can't communicate verbally with a Japanese speaker, similarly, two computers need to speak the same language to communicate.

This "language" that computers use is called a protocol. The most popular protocol for web communication is HTTP, which stands for Hypertext Transfer Protocol.




> HTTP Requests and Responses
At the heart of HTTP is a simple request-response system. The "requesting" computer, also known as the "client", asks another computer for some information. That computer, "the server" sends back a response with the information that was requested.

HTTP Powers Websites
HTTP, or Hypertext Transfer Protocol, is a protocol designed to transfer information between computers.

There are other protocols for communicating over the internet, but HTTP is the most popular and is particularly great for websites and web applications. Each time you visit a website, your browser is making an HTTP request to that website's server. The server responds with all the text, images, and styling information that your browser needs to render its pretty website!


![image](https://github.com/user-attachments/assets/075027db-ddbe-4e96-b827-684c9204f7cf)


<br />

# HTTP URLS
HTTP URLs
A URL, or Uniform Resource Locator, is the address of another computer, or "server" on the internet. Part of the URL specifies where to reach the server, and part of it tells the server what information we want.


Put simply, a URL represents a piece of information on some computer somewhere. We can get access to it by making a request, and reading the response that the server replies with.

![image](https://github.com/user-attachments/assets/07f80b1c-8c62-442a-ae7f-54796dd1aadd)


<br />

Using URLs in HTTP
The http:// at the beginning of a website URL specifies that the http protocol will be used for communication.

![image](https://github.com/user-attachments/assets/d98fc600-8a72-4961-bae8-53f183e35435)

Other communication protocols use URLs as well, (hence "Uniform Resource Locator"). That's why we need to be specific when we're making HTTP requests by prefixing the URL with http://


<br />
# Request and Responses
  ![image](https://github.com/user-attachments/assets/99166481-b414-4aa3-aa85-479023c3a397)


  
- A "client" is a computer making an HTTP request (whether it's a phone, a laptop, a desktop etc.).
- A "server" is a computer responding to an HTTP request.
- A computer can be a client, a server, both, or neither. "Client" and "server" are just words we use to describe what computers are doing within a communication system.
- Clients send requests and receive responses.
- Servers receive requests and send responses.


<br />

# Web Clients

A client can be any type of device but is often something users physically interact with. For example:

- A desktop computer.
- A mobile phone.
- A tablet.
- In a website or web application, we call the user's device the "front-end".

A front-end client makes requests to a back-end server.

![image](https://github.com/user-attachments/assets/1102bb90-1fe3-4aec-8eb0-9f38b2f4c5c5)


<br />

# Web Servers

Up to this point, most of the data you have worked with in your code has simply been generated and stored locally in variables.

While you'll always use variables to store and manipulate data while your program is running, most websites and apps use a web server to store, sort, and serve that data so that it sticks around for longer than a single session, and can be accessed by multiple devices.

Listening and Serving Data
Similar to how a server at a restaurant brings your food to the table, a web server serves web resources, such as web pages, images, and other data. The server is turned on and "listening" for inbound requests constantly so that the second it receives a new request, it can send an appropriate response.

The Server Is the Back-End
While the "front-end" of a website or web application is the device the user interacts with, the "back-end" is the server that keeps all the data housed in a central location.

A Server Is Just a Computer
"Server" is just the name we give to a computer that is taking on the role of serving data across a network connection. A good server is turned on and available 24 hours a day, 7 days a week. While your laptop can be used as a server, it makes more sense to use a computer in a data center that's designed to be up and running constantly.

Any computer can be a server, but the best servers are made for serving data.

<br />

# JSON Syntax

JSON (JavaScript Object Notation), is a standard for representing structured data based on JavaScript's object syntax. It is commonly used to transmit data in web apps via HTTP. For example, The HTTP requests we have been making in this course have been returning Jello issues as JSON.

JSON supports the following primitive data types:

Strings, e.g. "Hello, World!"
Numbers, e.g. 42 or 3.14
Booleans, e.g. true
Null, e.g. null
And the following collection types:

Arrays, e.g. [1, 2, 3]
Object literals, e.g. {"key": "value"}
JSON is similar to JavaScript objects and Python dictionaries. Keys are always strings, and the values can be any data type, including other objects.

The following is valid JSON data:
```json
{
    "movies": [
        {
            "id": 1,
            "title": "Iron Man",
            "director": "Jon Favreau",
            "favorite": true
        },
        {
            "id": 2,
            "title": "The Avengers",
            "director": "Joss Whedon",
            "favorite": false
        }
    ]
}
```


# Decoding JSON

When we receive JSON data in the body of an HTTP response, it comes as a stream of bytes. As we saw before, we can just convert the bytes to a string... 



JSON is a stringified representation of a JavaScript object, which makes it perfect for saving to a file or sending in an HTTP request. Remember, an actual JavaScript object is something that exists only within your program's variables. If we want to send an object outside our program, for example, across the internet in an HTTP request, we need to convert it to JSON first.

Just because JSON is called JavaScript Object Notation doesn't mean it's only used by JavaScript code! JSON is a common standard that is recognized and supported by every major programming language. For example, even though Boot.dev's backend is written in Go, we still use JSON as the communication format between the front-end and backend.


Common Use-Cases
- In HTTP request and response bodies.
- As formats for text files. .json files are often used as configuration files.
- In NoSQL databases like MongoDB, ElasticSearch and Firestore.


<hr />

# URI 

Uniform Resource Identifiers

A URI, or Uniform Resource Identifier, is a unique character sequence that identifies a resource that is (almost always) accessed via the internet.


## URIs come in two main types:

- URLs
- URNs

![image](https://github.com/user-attachments/assets/8ce49cac-550f-4eff-babb-c8cce96249ca)

### Sections of a URL
- URLs have a quite a few sections. Some are quired, some are not.

```go
URL {
	protocol: "http",
	username: "testuser",
	password: "testpass",
	hostname: "testdomain.com",
	port:     "8080",
	pathname: "/testpath",
	search:   "testsearch=testvalue",
	hash:     "testhash",
}
```

- There are 8 main parts to a URL, though not all the sections are always present. Each piece plays a role in helping clients locate the droids resources they're looking for.
![image](https://github.com/user-attachments/assets/3721a0ae-df9f-458b-a026-30745b1fc546)

| Part      | Required                  |
|-----------|---------------------------|
| Protocol  | Yes                       |
| Username  | No                        |
| Password  | No                        |
| Domain    | Yes                       |
| Port      | No (defaults to 80 or 443)|
| Path      | No (defaults to /)        |
| Query     | No                        |
| Fragment  | No                        |


### The Protocol
- "protocol" (also reffered to as the "scheme") is the first component of a URL. It defines the rules by ewhih the data being communicated is displayed, encoded or formatted.

- Some examples of different URL procols:
- http
- ftp
- mailto
- https 

- Not all schemes require a **"//"**
- The "http" in a URL is always followed by "**://**".
- All URls have the colon, but the "//" part is only included for schemes that have an 	[authority component](	https://www.rfc-editor.org/rfc/rfc3986#section-3.2).
- The "**mailto**" scheme doesn't use an authority component, so it doesn't need the slashes.

<br />

### URL Ports
- The port in a URL is a virutal point where network connections are made. Ports are managed by a computer's operating system and are numbered from  0 to 65535. (Though port 0 is reserved for the system API).

- Whenever you connect to anotehr computer over a network, you're connecting to a specfic port on that comuputer, which is listened to by a program on that computer. A port can only be used by one program at a time, which is why there are so many possible ports.
- The port component of a URL is often not visible when browsing normal sites on the internet, because 99% of the time you're using the default ports for the HTTP and HTTPs: 80 and 443 respectively.

- Whenver you aren't using a default port, you need to specify it in URL. For example, port 8080 is often used by web developers when they're running their server in "test mode" on their machines."


### URL Paths
- A URL's path mirrors the server's filesystem hierarchy.

- For example, if the website https://exampleblog.com had a static web server running in its /home directory, then a request to https://exampleblog.com/site/index.html would probably return the file located at /home/site/index.html.

- But technically, this is just a convention. The server could be configured to return any file or data given that path.

<br/>

### Query Parameters
- Query parameters in a URL are not always present. In the context of websites, query paramters are often used for marketing analytics or for changing a variable on the web page.
- Query parameters rarely change which page you're viewing, though they often will change the page's contents.

<br />
### How Google Uses Query Parameters
1. Open a new tab and go to https://google.com.
2. Search for the term "hello world"
3. Take a look at your current URL. It should start with https://www.google.com/search?q=hello+world
4. Change the URL to say https://www.google.com/search?q=hello+universe
5. Press "enter"
- You should see new search results for the query "hello universe". Google chose to use query parameters to represent the value of your search query. It makes sense - each search result page is essentially the same page as far as HTML structure and CSS styling are concerned - it's just showing you different results based on the search query.

<hr />



# DNS
= In the real world, we use physical addresses to help us find where a friend lives, where a business is located, or where a party is being thrown.
In computing, web clients find other computesr over the internet using **Internet Protocol** (IP) addersses. Each device connected to the internet has a unique IP address.


## DomainNames and IP Addresses
- A "domain name" or "host name" is just one portion of a URL. 	
- Ex. https://netflix.com/action has a hostname 'netflix.com'. 
- The https:// and /action portions aren't part of the domain name -> IP address mapping.



<br>
<br>
<hr>

# HTTP Headers
- [HTTP header](https://developer.mozilla.org/en-US/docs/Glossary/HTTP_header) allows client and servers to pass additional information with each request or response. Headers are just case-insensitive [key-value pairs](https://en.wikipedia.org/wiki/Name%E2%80%93value_pair) that pass additional [metadata](https://en.wikipedia.org/wiki/Metadata) about the request or response.

- HTTP requests from a web browser automatically carry with them many headers, including but not limited to:
- The type of client (e.g. Google Chrome)
- The Operating system (e.g. Windows)
- The preffered language (e.g. US English)

<br>

## Why are Heders Useful?
- Headers are useful for several reasons from design to securitt.
- mostly used for [metadata](https://en.wikipedia.org/wiki/Metadata) about the request and response itself.
- For example, let's say we wanted to ask for a player's level from the server. We need to send that player's ID to the server so it knows which layer to send back the information for.  


<br>

- [Auhentication](https://auth0.com/intro-to-iam/what-is-authentication) is a common use cae for headers. If I ask to upload an image to Facebook. I need to provide authentication information that I'm logged in, but that auth info isn't the request itself, it's just additional information about the request.


<br>
<hr>

# HTTP Methods - GET
- HTTP defines a set of [methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods). We must choos one to use each time we make an HTTP request. The most common ones include:
- GET
- POST
- PUT
- DELETE


<br>
- The [GET Method](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods/GET) is used to "get" a representation of a specified resource. It doesn't take (remove) the data from the server but rather gets a representation, or copy, of the resource in its current state. A GET request is considered [safe](https://developer.mozilla.org/en-US/docs/Glossary/Safe/HTTP) method to call multiple times because it shouldn't alter the state of the server.

## Why use HTTP methods?
- The primary purpose of HTTP methods is to indiciate to the server what we want to do with the resource we're trying to interact with. At the end of the day, and HTTP method is just a string, like **GET, POST, PUT,** or **DELETE**, but by convention, backend developers write their server code so that the metohds correspond with different **"CRUD"** actions.
- CRUD - Create, Read, Update, Delete
| HTTP Method | CRUD Action |
|-------------|-------------|
| GET         | Read        |
| POST        | Create      |
| PUT         | Update      |
| DELETE      | Delete      |

- HTTP methods map to crud actions by convention.
- To update a user account, I would probably use a **PUT** request.

<br>

## POST Request
- An [HTTP POST request](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods/POST) sends data to a server, typically to create a new resource.


<br>
### Adding a Body
- The body of th request is the payload sent to the server. The special `Content-Type` header is is used to tell the server the format of the body: `application/json` for JSON data in our case. `POST` requests are generally not safe methods to call multiple times because that wuld create duplicate records.

<br>

## HTTP PUT
- The HTTP [PUT](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods/PUT) method creates or updates the target resource with the contents of the request's `body`. 

### POST vs PUT
- While `POST` and `PUT` are both used for creating resources, `PUT` is more common for updates and is [idempotent](https://developer.mozilla.org/en-US/docs/Glossary/Idempotent), meaning it's safe to make the same request multiple times without changing the server state more than once. 

# HTTP Method Examples: POST vs PUT

This example illustrates how `POST` and `PUT` behave differently when making repeated requests to the same resource.

## POST Example

```http
POST /users/bob  # Create 'bob' user
POST /users/bob  # Attempt to create duplicate 'bob' user
POST /users/bob  # Attempt to create duplicate 'bob' user again
```

- POST is non-idempotent, meaning each call can result in a different outcome.

- Repeated POST requests may create duplicates or return errors depending on server logic.

<br>

# PUT Request Example: Idempotent Behavior

- This example demonstrates the idempotent nature of the HTTP `PUT` method by sending the same request multiple times to the same resource.


```http
PUT /users/bob  # Create 'bob' user if it doesn't exist
PUT /users/bob  # Update 'bob' user with the same data
PUT /users/bob  # Update 'bob' user with the same data again
```

<br>

## DELETE
- The `DELETE` method does exactly what you expect: it deletes a specified resource.

<br>
<hr>

## # HTTP Status Codes

The Status Code of an HTTP response tells the client whether or not the server was able to fulfill the request. Status codes are 3-digit numbers that are grouped into categories:

- **100–199**: Informational responses. These are very rare.
- **200–299**: Successful responses. Hopefully, most responses are 200's!
- **300–399**: Redirection messages. These are typically invisible because the browser or HTTP client will automatically do the redirect.
- **400–499**: Client errors. You'll see these often, especially when trying to debug a client application.
- **500–599**: Server errors. You'll see these sometimes, usually only if there is a bug on the server.

## Common HTTP Status Codes

| Code | Name                  | Description                                                                 |
|------|-----------------------|-----------------------------------------------------------------------------|
| 200  | OK                    | Everything worked as expected.                                              |
| 201  | Created               | A resource was created successfully, typically in response to a POST.      |
| 301  | Moved Permanently     | The resource was moved; the new location is included in the response.       |
| 400  | Bad Request           | The client made a mistake in their request.                                |
| 401  | Unauthorized          | The client lacks valid authentication credentials.                         |
| 404  | Not Found             | The requested resource doesn't exist.                                      |
| 500  | Internal Server Error | Something went wrong on the server, likely a bug.                          |

> 🔗 For a complete list of HTTP status codes, refer to the official documentation or [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status).


<br>
<hr>
