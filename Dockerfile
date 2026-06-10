FROM eclipse-temurin:25@sha256:edb3aa0f621796d8f5f9d602c7611ffdf015cd89e6ddda1894d85a3a99d170a8

RUN mkdir /opt/metadiff/
COPY build/install/metadiff /opt/metadiff/
ENTRYPOINT ["/opt/metadiff/bin/metadiff"]
