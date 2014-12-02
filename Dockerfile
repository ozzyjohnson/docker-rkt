FROM debian:jessie

MAINTAINER Ozzy Johnson <docker@ozzy.io>

ENV DEBIAN_FRONTEND noninteractive

ENV RKT_VERSION v0.1.0
ENV RKT_INSTALL https://github.com/coreos/rocket/releases/download/$RKT_VERSION/rocket-$RKT_VERSION.tar.gz

RUN \
    apt-get update \
        --quiet \
    && apt-get install \
        --yes \
        --no-install-recommends \
        --no-install-suggests \
    ca-certificates \
    curl \
    libseccomp2 \

# Clean up packages.
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Get ready to build.
WORKDIR /tmp

# Get rocket and launch.
RUN curl \
    -L $RKT_INSTALL \
    -o rocket-$RKT_VERSION.tar.gz \
    && tar \
        -C / \
        -xzvf rocket-$RKT_VERSION.tar.gz \ 
    && rm -rf rocker-$RKT_VERSION.tar.gz

VOLUME ["/data"]

WORKDIR /data

ENTRYPOINT ["/rocket-v0.1.0/rkt"]
