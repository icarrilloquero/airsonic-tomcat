# airsonic-tomcat

A docker image to run [Airsonic](https://github.com/airsonic/airsonic) inside a tomcat container. This image is ready for transcoding and to work behind a reverse proxy.

### Prerequisites

Docker and docker-compose

### Installing

Clone the repo and set the MUSIC_FOLDER variable to point to your music library. Either edit the docker-compose.yml file, or create a ".env" file. then just run docker-compose:

```
docker-compose up -d
```
