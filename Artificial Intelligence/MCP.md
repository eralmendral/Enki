# What is MCP?
- Allow LLM to access personal API

# MCP has client and server


# Two built-in MCP transports:
1. STDIO 
 - Standard input/output -  Best for local dev or command-line tools.

2. Streamable HTTP (SSE) - Used in production. It sends HTTP POST requests from the client to server, and uses Server-Sent Events to stream back responses.


# Building MCP Server




# Model Context Protocol

1. What is the primary purpose of the MCP?
- To enable seamless integration betweem LLM applications and external data sources/tools.

2. In the MCP Architecture, what is the purpose of MCP Server?
- it's a lightweight program exposing specific capabilities (like tools or data) via the MCP protocol.

3. Based on the MCP general architecture diagram, where do MCP Servers typically run?
- On the user's local computer, potentially accessing local data or remote services or remotely on the cloud.



## MCP Architecture
- Standardizes how applications provide context to LLMs. 
- Context to LLMs can be 'additional information' , 'tools to be invoke', or prompt itself.


- Hosts, Clients, Protocols, Servers
- MCP Clients, connect to MCP servers via MCP Protocol
- There is a 1 to 1 connection between an MCP client and server.
- You can't have an MCP client that talks to multiple server.



## MCP Servers
- Wrapper or Interfaces that federates access to various systems and tools making it accessible to AI applications in standardized way.
- Exposes:
1. Tools - "model controlled" - functions invoked by the model - (retrieve/search, send message, update DB).
2. Resources - "application controlled" - data exposed to the application - (files, db records, API responses).
3. Prompts  - "user controlled" - pre-defined templates for AI interactions - (Documentation Q&A, Transcript Summary, Output as JSON).


## LLM.txt
- https://llmstxt.org/

## mcpdoc
- 
