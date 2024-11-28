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

To do thison m1 mac, run: 
```
docker build --platform=linux/amd64 -t ghcr.io/tflashman/alpinelinuxtest .
```

To run with docker compose, first install docker compose.




### logging into github
Save your personal access token (classic). We recommend saving your token as an environment variable.

export CR_PAT=YOUR_TOKEN
Using the CLI for your container type, sign in to the Container registry service at ghcr.io.

$ echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
> Login Succeeded
 from https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry


 ### push image to github
 docker push ghcr.io/tflashman/alpinelinuxtest:v1