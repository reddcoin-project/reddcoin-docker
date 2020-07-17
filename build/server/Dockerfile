FROM ubuntu:20.04
LABEL maintainer="robin@shroomlife.de"
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /root

ENV REDDCOIN_VERSION "3.10.1"

COPY ./bin/reddcoin-${REDDCOIN_VERSION} /usr/local/bin
RUN mkdir -p /root/.reddcoin
RUN find /usr/local/bin -type f -exec chmod u+x {} \;

ENV RPC_SERVER 1
ENV RPC_USERNAME rpcusername
ENV RPC_PASSWORD rpcpassword
ENV RPC_PORT 45443
ENV RPC_ALLOW_IP 0.0.0.0/0.0.0.0

COPY ./setup.sh .
CMD [ "/root/setup.sh" ]
