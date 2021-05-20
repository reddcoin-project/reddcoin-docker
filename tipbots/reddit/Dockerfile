FROM python:slim
LABEL maintainer="info@reddcoin.com"

RUN apt-get update \
  && apt-get install -y --no-install-recommends git \
  libmariadb-dev \
  gcc \
  && apt-get -y autoremove \
  && apt-get -y clean

COPY requirements.txt .
ENV VERSION=0.1
RUN pip3 install -r requirements.txt
WORKDIR /root
RUN git clone https://github.com/reddcoin-project/SocialTipBot

WORKDIR /root/SocialTipBot/src

EXPOSE 3000 3000

CMD [ "./run.py"]
ENTRYPOINT ["python3"]
