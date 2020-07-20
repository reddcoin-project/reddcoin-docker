# Reddcoin Docker Environment
Dockerized packages of Reddcore Core, DNS-Seed and other easy-to-implement Reddcoin infrastructure components.

# Prerequisites

Install Docker: https://docs.docker.com/get-started/

# Getting Started

## Running Docker Container

```
docker run --name reddcoin-server --expose 45443 reddcoincore/server:latest
```

## Using Docker Compose

You need to habe Docker Compose installed. Get it here: https://docs.docker.com/compose/install/

```
docker-compose up -d reddcoin-server
```

## Docker Images

* [reddcoincore/server:latest](https://hub.docker.com/repository/docker/reddcoincore/server) (Reddcoin Wallet Server)
* [reddcoincore/compiler:latest](https://hub.docker.com/repository/docker/reddcoincore/compiler) (Compiler & Binary Builder)
* [reddcoincore/seeder:latest](https://hub.docker.com/repository/docker/reddcoincore/seeder) (DNS Seeder)
