# purpurmc-docker
PurpurMC server with select-able versions.  
This image is forked from phyremaster/papermc-docker.  
Thank you.

## docker-compose.yml Example

```
version: '3.8'
services:
  minecraft_server:
    image: hirosukt/purpurmc-docker:latest
    restart: always
    environment:
      MC_RAM: "12G"
      MC_VERSION: "1.19.2"
    volumes:
      - "/srv/purpur/:/purpurmc"
    ports:
      - "25565:25565"
```
