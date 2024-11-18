FROM alpine:latest

# ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /minecraft

RUN apk update &&\
    apk add openjdk21-jre-headless\
    wget

# RUN apt-get update && apt-get install -y \
#     openjdk-21-jre-headless \
#     wget \
#     && rm -rf /var/lib/apt/lists/*

RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/45810d238246d90e811d896f87b14695b7fb6839/server.jar

RUN echo "eula=true" > eula.txt

EXPOSE 25565

ENTRYPOINT [ "java" ]

CMD [  "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui" ]
