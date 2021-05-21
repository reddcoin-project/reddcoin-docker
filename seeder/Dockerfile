FROM debian:stretch-slim as builder
LABEL maintainer="info@reddcoin.com"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git build-essential libboost-all-dev libssl-dev
WORKDIR /src

# TODO: Change to official Reddcoin repository
RUN git clone https://github.com/reddcoin-project/reddcoin-seeder.git

RUN cd ./reddcoin-seeder && make

FROM debian:stretch-slim
LABEL maintainer="info@reddcoin.com"
RUN apt-get update && apt-get install -y openssl \
    && apt -y autoremove \
    && apt -y clean

COPY --from=builder /src/reddcoin-seeder/dnsseed /usr/local/bin

EXPOSE 53/udp

CMD [ "dnsseed" ]

# example configured command: dnsseed -h $HOSTNAME -n $IPADDRESS -p 53
