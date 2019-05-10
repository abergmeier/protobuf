FROM alpine:edge

ADD https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/protobuf-cpp-3.7.1.tar.gz /tmp/protobuf-cpp.tar.gz

RUN apk update && \
    apk add git curl build-base autoconf automake libtool && \
    cd /tmp/ && \
    wget https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/protobuf-cpp-3.7.1.tar.gz /tmp/protobuf-cpp.tar.gz -O /tmp/protobuf-cpp.tar.gz && \
    tar -xzf /tmp/protobuf-cpp.tar.gz && \
    rm /tmp/protobuf-cpp.tar.gz && \
    cd /tmp/protobuf-3.7.1 && \
    ./autogen.sh && \
    ./configure --prefix=/usr/local && \
    make && \
    make check && \
    make install && \
    cd /tmp && \
    rm -rf /tmp/protobuf-3.7.1
