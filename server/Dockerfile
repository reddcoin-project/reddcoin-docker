FROM ubuntu:20.04
LABEL maintainer="info@reddcoin.com"
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
ENV RPC_ALLOW_IP1 0.0.0.0/0
ENV RPC_ALLOW_IP2 172.17.0.0/16

COPY ./setup.sh .
RUN chmod u+x /root/setup.sh

EXPOSE 45443 45444

CMD [ "/root/setup.sh" ]
