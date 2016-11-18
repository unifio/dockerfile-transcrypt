FROM alpine:3.4
MAINTAINER "Unif.io, Inc. <support@unif.io>"

ENV TRANSCRYPT_VERSION 0.9.8

RUN apk add --no-cache --update bash grep git openssl && \
    cd /usr/local && \
    git clone https://github.com/elasticdog/transcrypt.git && \
    cd transcrypt && \
    git checkout v${TRANSCRYPT_VERSION} && \
    ln -s ${PWD}/transcrypt /bin/transcrypt

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/bin/transcrypt"]

CMD ["--help"]
