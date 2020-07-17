FROM ubuntu:20.04
LABEL maintainer="robin@shroomlife.de"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git build-essential libboost-all-dev libssl-dev
RUN mkdir /git && cd /git && git clone https://github.com/reddink/reddcoin-seeder.git && chmod 777 * -R

USER root

RUN echo "cd /git/reddcoin-seeder" > /git/reddcoin-seeder/make.sh && echo "make" >> /git/reddcoin-seeder/make.sh && chmod 777 /git/reddcoin-seeder/make.sh
RUN /git/reddcoin-seeder/make.sh

EXPOSE 53/udp
