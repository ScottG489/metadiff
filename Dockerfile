FROM eclipse-temurin:25@sha256:42fc3fe6804ec612f5ef8a613f8c06d8dd578de6207336077387d4cb32edaa9b

RUN mkdir /opt/metadiff/
COPY build/install/metadiff /opt/metadiff/
ENTRYPOINT ["/opt/metadiff/bin/metadiff"]
