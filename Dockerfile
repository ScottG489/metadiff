FROM eclipse-temurin:25@sha256:acab08ae09273ee938c1da6111ed60ff51ab0ab18325e4b1b81178039059f86e

RUN mkdir /opt/metadiff/
COPY build/install/metadiff /opt/metadiff/
ENTRYPOINT ["/opt/metadiff/bin/metadiff"]
