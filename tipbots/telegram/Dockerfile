FROM python:slim
LABEL maintainer="info@reddcoin.com"

RUN apt-get update \
  && apt-get install -y --no-install-recommends git \
  && apt-get -y autoremove \
  && apt-get -y clean

COPY requirements.txt .
RUN pip3 install -r requirements.txt
WORKDIR /root

RUN git clone https://github.com/cryptoBUZE/reddbot-telegram

WORKDIR /root/reddbot-telegram

CMD [ "./reddbot.py"]
ENTRYPOINT ["python3"]
