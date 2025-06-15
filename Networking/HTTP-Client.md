# Ether
Networking

<hr />

- HTTP
- JSON
 
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


URIs come in two main types:

- URLs
- URNs

![image](https://github.com/user-attachments/assets/8ce49cac-550f-4eff-babb-c8cce96249ca)




<hr />

# DNS
= In the real world, we use physical addresses to help us find where a friend lives, where a business is located, or where a party is being thrown.
In computing, web clients find other computesr over the internet using **Internet Protocol** (IP) addersses. Each device connected to the internet has a unique IP address.


## DomainNames and IP Addresses
- A "domain name" or "host name" is just one portion of a URL. 	
- Ex. https://netflix.com/action has a hostname 'netflix.com'. 
- The https:// and /action portions aren't part of the domain name -> IP address mapping.

-  































