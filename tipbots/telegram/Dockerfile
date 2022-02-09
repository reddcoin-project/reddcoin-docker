FROM ubuntu:20.04
LABEL maintainer="info@reddcoin.com"
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /root

# install system/build dependencies
RUN apt -y update -qq \
    && apt -y install -qq --no-install-recommends \
        python3 \
        python3-pip \
        python3-dev \
        build-essential \
        git \
    && apt -y autoremove \
    && apt -y clean

RUN pip3 install \
    requests \
    beautifulsoup4 \
    pyqrcode \
    Image \
    pypng \
    emoji \
    apscheduler

RUN pip3 install python-telegram-bot==12.0.0b1 --upgrade

RUN git clone https://github.com/cryptoBUZE/reddbot-telegram

WORKDIR /root/reddbot-telegram

CMD [ "./reddbot.py"]
ENTRYPOINT ["python3"]

