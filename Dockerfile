FROM eclipse-temurin:25@sha256:c3a5cfd77c9a43dd95269a266290d365b79b174381d8336a3f76a7ae117beefa

RUN mkdir /opt/metadiff/
COPY build/install/metadiff /opt/metadiff/
ENTRYPOINT ["/opt/metadiff/bin/metadiff"]
