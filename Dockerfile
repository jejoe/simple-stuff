FROM docker.io/ibmcom/websphere-liberty:20.0.0.5-full-java11-openj9-ubi
COPY target/simple-stuff.war /config/dropins/
COPY config/server.xml /config/
COPY config/server.env /config/

RUN useradd spuser && \
    mkdir -p /opt/my-special-folder && \
    chown -R spuser /opt/my-special-folder
    chgrp -R 0 /opt/my-special-folder && \
    chmod -R g=u /opt/my-special-folder

COPY Dockerfile /my-special-folder/

USER spuser
