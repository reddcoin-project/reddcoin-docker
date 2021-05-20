FROM ubuntu:14.04 as builder
LABEL maintainer="info@reddcoin.com"
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /root

RUN apt-get update
RUN apt-get install -y git software-properties-common wget unzip
RUN apt-get install -y build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev bsdmainutils
RUN apt-get install -y libevent-dev python3 curl

RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y libdb4.8-dev libdb4.8++-dev

RUN git clone https://github.com/reddcoin-project/reddcoin.git

WORKDIR /root/reddcoin

RUN chown -R root:root /root/reddcoin

RUN ./autogen.sh && ./configure --without-gui

RUN make
RUN make install

FROM ubuntu:14.04
LABEL maintainer="info@reddcoin.com"

RUN apt-get update \
    && apt-get install -y git software-properties-common \
    && add-apt-repository ppa:bitcoin/bitcoin \
    && apt-get update \
    && apt-get install -y libboost-all-dev libdb4.8-dev libdb4.8++-dev miniupnpc \
    && apt-get purge -y software-properties-common \
    && apt-get autoremove --yes \
    && apt-get clean --yes

COPY --from=builder /usr/local/bin/* /usr/local/bin/
