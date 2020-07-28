#!/bin/bash
set -ex
CONFIG_PATH=/root/.reddcoin/reddcoin.conf
echo "server=$RPC_SERVER" >> $CONFIG_PATH
echo "rpcuser=$RPC_USERNAME" >> $CONFIG_PATH
echo "rpcpassword=$RPC_PASSWORD" >> $CONFIG_PATH
echo "rpcport=$RPC_PORT" >> $CONFIG_PATH
echo "rpcallowip=$RPC_ALLOW_IP1" >> $CONFIG_PATH
echo "rpcallowip=$RPC_ALLOW_IP2" >> $CONFIG_PATH
echo "printtoconsole=1" >> $CONFIG_PATH

if [ -f "/root/bootstrap/bootstrap050120.zip" ]; then
  if [ -d "/root/.reddcoin/blocks" ]; then
    echo "Skipping Bootstrap file cause of already existent blocks in /root/.reddcoin"
  else
    cd /root/.reddcoin && rm -rf blocks chainstate database
    apt-get update && apt-get install -y unzip
    unzip /root/bootstrap/bootstrap050120.zip -d /root/.reddcoin
  fi
fi

[ -f "/root/.reddcoin/.lock" ] && rm -f /root/.reddcoin/.lock
/usr/local/bin/reddcoind
