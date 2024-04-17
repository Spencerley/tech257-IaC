# Docker

## What is Docker?
- It’s a containerisation platform
- It uses api’s in the background and makes it easier for us to communicate with anything we need
- 3 ways:
    - Docker Client
    - Docker Host
    - Docker Hub
- Lightweight especially compared to virtualisation
- How does it communicate?
- How does it work?
- Commands:
    - `docker build`
    - `docker pull`
    - `docker run`
- Example command:

    
- What is containerisation?
    - Example from Shahrukh:
        - `docker run -d -p 80:80 nginx`
            - d runs in background (detached mode) -p (port) connect my port 80 to the port 80 of the image.
        - Runs a container on our machine
        - Go to [localhost:80](http://localhost:80) to check it out
        - `docker ps`            
        - To end it - `docker stop <container id>`
        - Can restart the same one - `docker start <container id>`
        - To delete - `docker rm <container id>`
            - Can’t delete them while running, either stop or use `docker rm <container id> -f`
        - `docker ps -a` to see all of them including stopped ones
        - If you run the nginx one again it gets a new id as its a new container
        - To interact with it `docker exec -it <container id> sh` :
            - `uname -a` to get details of machine
            - update and upgrade as normal
            - Will need to install sudo
            - `cd /usr`
            - `cd share`
            - `cd nginx`
            - `cd html`
            - `sudo apt-get install nano`
            - nano and make a change and it loads instantly
- Create docker hub account
- Create docker image and make it available globally
    - `docker commit <container id> spencerley/tech257-first-image:nginx-edit`
    - `docker push spencerley/tech257-first-image:nginx-edit`
- Portmapping