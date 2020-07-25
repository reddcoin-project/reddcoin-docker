FROM ubuntu:20.04
LABEL maintainer="info@reddcoin.com"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git build-essential libboost-all-dev libssl-dev

# TODO: Change to official Reddcoin repository
RUN cd /usr && git clone https://github.com/shroomlife/reddcoin-seeder.git
WORKDIR /usr/reddcoin-seeder

RUN make
RUN mv /usr/reddcoin-seeder/dnsseed /usr/local/bin

COPY ./setup.sh .
RUN chmod u+x /usr/reddcoin-seeder/setup.sh

EXPOSE 53/udp

# Cleanup Build Packages
RUN apt-get remove -y \
  build-essential libboost-all-dev libssl-dev
RUN apt-get autoremove -y

CMD [ "/usr/reddcoin-seeder/setup.sh" ]
