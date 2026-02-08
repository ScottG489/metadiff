FROM eclipse-temurin:25@sha256:5b691907413c1c67b1f2402a39c64736d02404e703aa6f688164be23f83f06c4

RUN mkdir /opt/metadiff/
COPY build/install/metadiff /opt/metadiff/
ENTRYPOINT ["/opt/metadiff/bin/metadiff"]
