FROM eclipse-temurin:25@sha256:68868d04fa9cfd5f5c6abec0b5cef86d8de2bf9c62c37c7d3e4f0f80f5cfd7ff

RUN mkdir /opt/metadiff/
COPY build/install/metadiff /opt/metadiff/
ENTRYPOINT ["/opt/metadiff/bin/metadiff"]
