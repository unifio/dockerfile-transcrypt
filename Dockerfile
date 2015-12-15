FROM alpine:3.2

ENV TRANSCRYPT_VERSION 0.9.7

RUN apk add --update bash git openssl && \
    cd /usr/local && \
    git clone https://github.com/elasticdog/transcrypt.git && \
    cd transcrypt && \
    git checkout -b v${TRANSCRYPT_VERSION} && \
    ln -s ${PWD}/transcrypt /bin/transcrypt && \
    rm -rf /var/cache/apk/*

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/bin/transcrypt"]

CMD ["--help"]
