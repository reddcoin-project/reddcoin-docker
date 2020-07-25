FROM ubuntu:20.04
LABEL maintainer="info@reddcoin.com"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git build-essential libboost-all-dev libssl-dev
WORKDIR /root

# TODO: Change to official Reddcoin repository
RUN git clone https://github.com/shroomlife/reddcoin-seeder.git

RUN cd ./reddcoin-seeder && make
RUN mv ./reddcoin-seeder/dnsseed /usr/local/bin
RUN rm -rf reddcoin-seeder

COPY ./setup.sh .
RUN chmod u+x /root/setup.sh

EXPOSE 53/udp

# Cleanup Build Packages
RUN apt-get remove -y \
  build-essential libboost-all-dev libssl-dev
RUN apt-get autoremove -y

CMD [ "/root/setup.sh" ]
