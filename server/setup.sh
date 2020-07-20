#!/bin/bash
set -ex
CONFIG_PATH=/root/.reddcoin/reddcoin.conf
echo "server=$RPC_SERVER" >> $CONFIG_PATH
echo "rpcuser=$RPC_USERNAME" >> $CONFIG_PATH
echo "rpcpassword=$RPC_PASSWORD" >> $CONFIG_PATH
echo "rpcport=$RPC_PORT" >> $CONFIG_PATH
echo "rpcallowip=$RPC_ALLOW_IP" >> $CONFIG_PATH
echo "printtoconsole=1" >> $CONFIG_PATH
/usr/local/bin/reddcoind
