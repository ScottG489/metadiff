FROM eclipse-temurin:25@sha256:10331564d9ae41b6a534ddea472f37270a3c286e89857261631a0d772a4d8617

RUN mkdir /opt/metadiff/
COPY build/install/metadiff /opt/metadiff/
ENTRYPOINT ["/opt/metadiff/bin/metadiff"]
