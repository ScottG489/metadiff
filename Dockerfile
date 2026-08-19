FROM eclipse-temurin:25@sha256:85765cc23cda09cdfc9af5cbd8dfeb8d4df3e4634a6a89936013962051aa2df8

RUN mkdir /opt/metadiff/
COPY build/install/metadiff /opt/metadiff/
ENTRYPOINT ["/opt/metadiff/bin/metadiff"]
