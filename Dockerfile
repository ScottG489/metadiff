FROM eclipse-temurin:25@sha256:1bda4d9e668f44f399abed30636c34e0befb727408fba27b1e6aaefcf9df346b

RUN mkdir /opt/metadiff/
COPY build/install/metadiff /opt/metadiff/
ENTRYPOINT ["/opt/metadiff/bin/metadiff"]
