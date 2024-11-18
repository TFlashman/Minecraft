Requires docker to run.

use docker compose to not have to run with arguments

with docker compose, run
```
docker-compose up
```
to run with default arguments.

To run without docker compose:
```
docker run -p 25565:25565 -e EULA=TRUE -d minecraft-fromscratch:latest
```



### requirements:
In this iteration, a local image i referenced in the compose.yml file. 
That means that the image has to be built locally with the name: alpine-minecraft

To do this, run: 
```
docker build -t alpine-minecraft .
```

To run with docker compose, first install docker compose.