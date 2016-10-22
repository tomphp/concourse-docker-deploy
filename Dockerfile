FROM alpine

RUN apk update \
    && apk add bash \
    && apk add wget \
    && apk add curl \
    && apk add jq

RUN mkdir /install

# Install docker client
RUN cd /install \
    && wget --no-check-certificate https://get.docker.com/builds/Linux/x86_64/docker-1.12.2.tgz \
    && tar xvzf docker-1.12.2.tgz \
    && cp docker/docker /usr/local/bin

# Install docker machine
RUN curl -L https://github.com/docker/machine/releases/download/v0.8.2/docker-machine-$(uname -s)-$(uname -m) >/usr/local/bin/docker-machine \
    && chmod +x /usr/local/bin/docker-machine

COPY ./resource /opt/resource
RUN chmod +x /opt/resource/*
