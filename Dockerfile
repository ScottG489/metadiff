FROM eclipse-temurin:25@sha256:12e44624adee6808a36d962717e1656e0afeeeff5a100f9cb00e0136513558f0

RUN mkdir /opt/metadiff/
COPY build/install/metadiff /opt/metadiff/
ENTRYPOINT ["/opt/metadiff/bin/metadiff"]
