#!/bin/bash
set -ex
CONFIG_PATH=/root/.reddcoin/reddcoin.conf
if [ ! -f $CONFIG_PATH ]; then
  echo "server=$RPC_SERVER" >> $CONFIG_PATH
  echo "rpcuser=$RPC_USERNAME" >> $CONFIG_PATH
  echo "rpcpassword=$RPC_PASSWORD" >> $CONFIG_PATH
  echo "rpcport=$RPC_PORT" >> $CONFIG_PATH
  echo "rpcallowip=$RPC_ALLOW_IP" >> $CONFIG_PATH
  echo "testnet=$TESTNET" >> $CONFIG_PATH
  echo "printtoconsole=1" >> $CONFIG_PATH
else
  echo "$CONFIG_PATH is already existent..."
fi

if [ -f "/root/bootstrap/"$BOOTSTRAP ]; then
  echo "Found /root/bootstrap/$BOOTSTRAP"
  echo "Which network are we targeting?"
  if [[ $TESTNET == 0 ]]; then
    echo "Pointing to MAINNET"
    if [ -d "/root/.reddcoin/blocks" ]; then
      echo "Skipping Bootstrap file cause of already existent blocks in /root/.reddcoin"
    else
      cd /root/.reddcoin && rm -rf blocks chainstate database
      apt-get update && apt-get install -y unzip
      unzip /root/bootstrap/$BOOTSTRAP -d /root/.reddcoin
    fi
  elif [[ $TESTNET == 1 ]]; then
    echo "Pointing to TESTNET"
    if [ -d "/root/.reddcoin/testnet3/blocks" ]; then
      echo "Skipping Bootstrap file cause of already existent blocks in /root/.reddcoin/testnet3"
    else
      cd /root/.reddcoin/testnet3 && rm -rf blocks chainstate database
      apt-get update && apt-get install -y unzip
      unzip /root/bootstrap/$BOOTSTRAP -d /root/.reddcoin/testnet3
    fi
  fi
else
  echo "Could not find /root/bootstrap/$BOOTSTRAP"
fi

[ -f "/root/.reddcoin/.lock" ] && rm -f /root/.reddcoin/.lock
/usr/local/bin/reddcoind
