FROM debian:stretch-slim
LABEL maintainer="info@reddcoin.com"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git build-essential libboost-all-dev libssl-dev
WORKDIR /src

# TODO: Change to official Reddcoin repository
RUN git clone https://github.com/reddcoin-project/reddcoin-seeder.git

RUN cd ./reddcoin-seeder && make
RUN mv ./reddcoin-seeder/dnsseed /usr/local/bin
RUN rm -rf reddcoin-seeder

# Cleanup Build Packages
RUN apt-get remove -y \
  build-essential libboost-all-dev libssl-dev
RUN apt-get autoremove -y

EXPOSE 53/udp

CMD [ "dnsseed" ]

# example configured command: dnsseed -h $HOSTNAME -n $IPADDRESS -p 53
