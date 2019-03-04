FROM java:8

RUN mkdir /opt/diff-info/
COPY build/install/diff-info /opt/diff-info/
ENTRYPOINT ["/opt/diff-info/bin/diff-info"]
