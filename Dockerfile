FROM tomcat:9-jre8

MAINTAINER <icarrilloquero@gmail.com>

# Setup transcoder
RUN apt-get update && apt-get install -y ffmpeg

RUN mkdir /var/airsonic /var/airsonic/transcode
RUN ln -s /usr/bin/ffmpeg /var/airsonic/transcode/fmpeg

# Enable redirects for nginx reverse proxy
RUN echo "server.use-forward-headers=true" >> /var/airsonic/airsonic.properties

ENV AIRSONIC_PORT=8080 CONTEXT_PATH=/airsonic/

EXPOSE $AIRSONIC_PORT/tcp

HEALTHCHECK --interval=15s --timeout=3s CMD wget -q http://localhost:"$AIRSONIC_PORT""$CONTEXT_PATH"rest/ping -O /dev/null || exit 1

VOLUME /var/music
VOLUME /var/playlists
VOLUME /var/airsonic

# Download WAR
RUN ["rm", "-fr", "/usr/local/tomcat/webapps/*"]
ADD https://github.com/airsonic/airsonic/releases/download/v10.2.1/airsonic.war $CATALINA_HOME/webapps/airsonic.war
