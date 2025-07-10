
### What is Docker and Why?

- container technology
- tool for creating and managing containers
- Container - standardized unit of software 


### Why Containers
- Different Development and Production environments
- Should be easy to share Development environments
- Tools should not clash in versions


### Virtual Machines vs Containers

- Virtual Machines = OS -> Virtual OS -> Libraries, Dependencies, Tools -> Application
  - Waste a lot of space on your hard drive and tends to be slow
- Docker = OS -> OS built-in / Emulated Container Support -> Docker Engine -> Containers [ Libraries, Dependencies, Tools] -> Applications 

### Setup
 - Follow documentation
 - Docker Playground 


 ### Docker Images & Containers

 - Image - shareable package
 - Container - running application
 

 - RUN -  executed on building image
 - CMD -  executed when containers is started


 - docker build . 
 - docker ps 

 - Images are readonly, you can't update by just changing code. Need to rebuild new image every changes.
 

### Image Layers
 - Only the instructions that has changes and layers below it are re evaluated. (Caching)
 - Layer based architecture - every instruction creates a layer.
 
### Summary
 - Code put into image
 - Create an image using Dockerfile
 - Dockerfile has detailed instructions / setup
 - Docker is about containers
 - But images are template of containers
 - Instantiate and run multiple containers based on image
 - Container is the running application - standalone
 - Container does not copy the code from an image into a new container or new file
 - The container will use the code used in the image, and use an extra layer and allocate resources to run that application but will not copy the code.
 - Code only exists in the image.
 
