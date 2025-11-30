FROM eclipse-temurin:25@sha256:adc4533ea69967c783ac2327dac7ff548fcf6401a7e595e723b414c0a7920eb2

RUN mkdir /opt/metadiff/
COPY build/install/metadiff /opt/metadiff/
ENTRYPOINT ["/opt/metadiff/bin/metadiff"]
