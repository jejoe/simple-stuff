FROM docker.io/ibmcom/websphere-liberty:20.0.0.5-full-java11-openj9-ubi

RUN mkdir -p /opt/app-root/my-special-folder
COPY Dockerfile /opt/app-root/my-special-folder/

RUN chgrp -R 0 /opt/app-root && \
    chmod -R g=u /opt/app-root

COPY target/simple-stuff.war /config/dropins/
COPY config/server.xml /config/
COPY config/server.env /config/

USER 1001
