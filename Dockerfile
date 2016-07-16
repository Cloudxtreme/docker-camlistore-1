FROM alpine:3.4
MAINTAINER theorician

ENV CAMLISTORE_GIT_TAG=0.9
ENV PUID=${PUID:-3060}
ENV PGID=${PGID:-3060}

RUN apk update && apk add --no-cache go git sqlite-dev

ADD build.sh /build.sh
RUN /build.sh

VOLUME ["/config", "/store"]

ADD run.sh /run.sh
CMD /run.sh