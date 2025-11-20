FROM eclipse-temurin:11

RUN mkdir /opt/metadiff/
COPY build/install/metadiff /opt/metadiff/
ENTRYPOINT ["/opt/metadiff/bin/metadiff"]
