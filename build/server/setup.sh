#!/bin/bash
set -ex
printf "server=1\nrpcuser=$RPC_USERNAME\nrpcpassword=$RPC_PASSWORD\nrpcport=$RPC_PORT\nrpcallowip=$RPC_ALLOW_IP\n" >> /root/.reddcoin/reddcoin.conf
/usr/local/bin/reddcoind