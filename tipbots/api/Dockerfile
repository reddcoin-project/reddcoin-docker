FROM ubuntu:bionic
LABEL maintainer="info@reddcoin.com"
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG C.UTF-8

WORKDIR /root

# install system/build dependencies
RUN apt -y update -qq \
    && apt -y install -qq --no-install-recommends \
        python3.6 \
        python3-dev \
        python3-pip \
        python3-setuptools \
        build-essential \
        mysql-client \
        libmysqlclient-dev \
        wget \
        sudo \
        software-properties-common \
        git \
        zip \
        unzip \
    && apt -y autoremove \
    && apt -y clean

RUN pip3 install \
    wheel \
    dateutils==0.6.7 \
    irc==18.0.0 \
    mysqlclient==1.4.6 \
    praw==7.2.0 \
    PyYAML==5.3 \
    flask==1.1.2 \
    Jinja2==2.10.1 \
    SQLAlchemy==1.3.12 \
    pymemcache==3.4.3

RUN pip3 install https://github.com/reddcoin-project/python-twitter-webhooks/archive/master.zip
RUN pip3 install https://github.com/reddcoin-project/python-reddcoinrpc/archive/master.zip
RUN pip3 install https://github.com/ryanmcgrath/twython/archive/master.zip

ENV VERSION=0.1
RUN  pip3 install https://github.com/dpifke/pifkoin/archive/master.zip

# RUN git clone https://github.com/reddcoin-project/SocialTipBot

WORKDIR /root/SocialTipBot/src

EXPOSE 4567 4567

CMD ["./_api.py"]
ENTRYPOINT ["python3"]

