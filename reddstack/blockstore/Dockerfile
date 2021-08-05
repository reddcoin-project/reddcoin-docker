FROM python:2.7-buster
LABEL maintainer="John Nash <gnasher@reddcoin.com>"
ENV DEBIAN_FRONTEND=noninteractive

COPY ./bin /usr/local/bin
COPY ./VERSION /tmp

WORKDIR /root

RUN apt-get update
RUN apt-get install -y git software-properties-common wget unzip

RUN mkdir -p /root/.blockstore /root/.blockstore/testnet

RUN VERSION=$(cat /tmp/VERSION) && \
    chmod a+x /usr/local/bin/* && \
    git clone https://github.com/reddcoin-project/pyreddcointools.git && \
    pip install ./pyreddcointools && \
    git clone -b master https://github.com/reddcoin-project/pyreddcoin.git && \
    pip install ./pyreddcoin && \
    git clone -b $VERSION https://github.com/reddcoin-project/virtualchain.git && \
    pip install ./virtualchain && \
    git clone -b $VERSION https://github.com/reddcoin-project/reddstack-client.git && \
    pip install ./reddstack-client && \
    git clone -b $VERSION https://github.com/reddcoin-project/reddstack.git && \
    cd reddstack && \
    pip install -r requirements.txt && \
    rm -rf /tmp/*

ENV BLOCKSTACK_TESTNET=0
ENV BLOCKSTACK_DEBUG=0
ENV RPC_SERVERNAME rpcservername
ENV RPC_USERNAME rpcusername
ENV RPC_PASSWORD rpcpassword
ENV RPC_PORT 45443

WORKDIR /root/reddstack

EXPOSE 6264

CMD ["init"]
