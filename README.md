# TS3AudioBot_docker

Dockerfile for https://github.com/Splamy/TS3AudioBot but on the Dev Branch

## Run from Dockerhub
Run: `docker run --name tsbot --restart=always -it -d -v /home/tsBot/data:/data rofl256/tsaudiobot`

## Build on Your own
Build: `docker build . -t tsaudiobot`

Run: `docker run --name tsbot --restart=always -it -d -v /home/tsBot/data:/data tsaudiobot`
