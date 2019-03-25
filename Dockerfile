FROM alpine:3.9

ENV SOCAT_VERSION=1.7.3.2-r5

RUN apk add --no-cache socat=$SOCAT_VERSION

CMD ["/usr/bin/socat", "-h"]

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="socat" \
      org.label-schema.version="1.7.3.2-r5" \
      org.label-schema.url="http://www.dest-unreach.org/socat/" \
      org.label-schema.vcs-url="https://github.com/oildex/docker-socat"
