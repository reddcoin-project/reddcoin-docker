# Reddcoin Docker Environment
Dockerized packages of Reddcore Core, DNS-Seed and other easy-to-implement Reddcoin infrastructure components.

# Prerequisites

Install Docker: https://docs.docker.com/get-started/

# Getting Started

## Running Docker Container

```
docker run --name reddcoin-server --expose 45443 shroomlife/reddcoin-docker:server
```

## Using Docker Compose

You need to habe Docker Compose installed. Get it here: https://docs.docker.com/compose/install/

```
docker-compose up -d reddcoin-server
```

## Docker Images

* shroomlife/reddcoin-docker:server (Reddcoin Wallet & Server)
* shroomlife/reddcoin-docker:builder (Compiler & Binary Builder)

### WIP
* shroomlife/reddcoin-docker:dnsseed (DNS Seeder)
