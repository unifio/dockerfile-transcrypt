FROM alpine:3.5
MAINTAINER "Unif.io, Inc. <support@unif.io>"

ENV TRANSCRYPT_VERSION 1.0.2

RUN apk add --no-cache bash grep git openssl && \
    cd /usr/local && \
    git clone https://github.com/elasticdog/transcrypt.git && \
    cd transcrypt && \
    git checkout v${TRANSCRYPT_VERSION} && \
    ln -s ${PWD}/transcrypt /bin/transcrypt

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/bin/transcrypt"]

