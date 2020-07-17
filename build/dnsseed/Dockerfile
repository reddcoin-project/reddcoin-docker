FROM ubuntu:20.04
LABEL maintainer="robin@shroomlife.de"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git build-essential libboost-all-dev libssl-dev
RUN cd /usr && git clone https://github.com/shroomlife/reddcoin-seeder.git
WORKDIR /usr/reddcoin-seeder

RUN make

EXPOSE 53/udp
