FROM ubuntu:20.04
LABEL maintainer="info@reddcoin.com"
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /root

# install system/build dependencies
RUN apt -y update -qq \
    && apt -y install -qq --no-install-recommends \
        python3 \
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
    dateutils==0.6.7 \
    irc==18.0.0 \
    mysqlclient==1.4.6 \
    praw==7.2.0 \
    PyYAML==5.3 \
    Jinja2==2.10.3 \
    SQLAlchemy==1.3.12

RUN pip3 install https://github.com/reddcoin-project/python-twitter-webhooks/archive/master.zip
RUN pip3 install https://github.com/reddcoin-project/python-reddcoinrpc/archive/master.zip
RUN pip3 install https://github.com/ryanmcgrath/twython/archive/master.zip


# RUN git clone https://github.com/reddcoin-project/SocialTipBot

WORKDIR /root/SocialTipBot/src

EXPOSE 3000 3000

CMD [ "./run.py"]
ENTRYPOINT ["python3"]

