# ReddCoin Docker Environment
Dockerized packages of Reddcore Core, DNS-Seed and other easy-to-implement Reddcoin infrastructure components.

# Prerequisites

Install Docker: https://docs.docker.com/get-started/

# Getting Started

## Running Docker Container

```
docker run --name reddcoin-server --expose 45443 reddcoincore/server:latest
```

## Using Docker Compose

You need to have Docker Compose installed. Get it here: https://docs.docker.com/compose/install/

```
docker-compose up -d reddcoin-server
```

```
services:
  reddcoin-server:
    container_name: reddcoin-server
    image: reddcoincore/server:latest
    build: ./server
    ports: 
      - "45443:45443"
# Use custom volume for data
#   volumes:
#     - "./.reddcoin:/root/.reddcoin"
# Inject Bootstrap for faster Startup
#     - "./bootstrap:/root/bootstrap"
    environment:
      - RPC_SERVER=1
      - RPC_USERNAME=username
      - RPC_PASSWORD=password
      - RPC_PORT=45443
      - RPC_ALLOW_IP=0.0.0.0/0
```

## Using Bootstrap Files

**IMPORTANT**: You need to download the bootstrap files on your own!

For a speeded up setup and faster starting of your staking you can use the ReddCoin bootstrap files. Just have a look inside the `docker-compose.yml` file for a better understanding.

The bootstrap file needs to be located at `/root/bootstrap/bootstrap050120.zip` inside the docker container. Take care of the naming!

[Download Bootstrap Files Here](https://github.com/reddcoin-project/bootstrap_files)

## Docker Images

* [reddcoincore/server:latest](https://hub.docker.com/repository/docker/reddcoincore/server) (Reddcoin Wallet Server)
* [reddcoincore/compiler:latest](https://hub.docker.com/repository/docker/reddcoincore/compiler) (Compiler & Binary Builder)
* [reddcoincore/seeder:latest](https://hub.docker.com/repository/docker/reddcoincore/seeder) (DNS Seeder)
