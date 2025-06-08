# Docker
- Docker is the big name in "containerization". The big idea behind Docker and other container technilogies is that they allow us to package our programs with an environment and ship the whole thing. most real world programs don't work in isolation, they need:
  - Files from disk
  - Environment variables
  - Installed dependencies
  - Specific permissions


- The are couple of moving parts to keep in mind when it comes to using Docker on your local machine:
1. Docker server or Docker Daemon. This listen to requests from the desktop app and executes them. If this isn't running nothing else will work.
2. Desktop Docker GUI. Starting the GUI should start the server. The GUI is the visual way to interact with Docker.
3. Docker CLI - most of our work will be interacting with Docker via The CLI. 



<hr />

# Containers
- a container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.


- We've had virtual machines for a long time. The trouble with virutal machines is that they're slow. Booting one up usually takes longer than a phyisical machine.

- Containers, on the other hand, gives us 90% of the benefits of virutal  machines, but are super lightweight. Containers boot up in seconds, while virtual machines can take minutes.

## Virtual Machine Architecture
- Infrastructure -> Hypervisor -> Guest OS -> App A -> Virtual Machine
- Infrastructure -> Hypervisor -> Guest OS -> App B -> Virtual Machine
- Infrastructure -> Hypervisor -> Guest OS -> App C -> Virtual Machine


## Container (Docker) Architecture
- Infrastructure -> Host OS -> Docker -> [App A, App B, App C]



- Virtual machines virtualize hardware, they emulate what a physical computer does at a low level. Containers virtualize at the oprating system level. Isotlation between containers that are running on the same machine is still really good. 


