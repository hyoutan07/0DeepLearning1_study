FROM python:3.6
USER root

RUN apt-get update && \
    apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 && \
    apt-get install -y vim less && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

COPY requirements.txt /root/

RUN pip install --upgrade pip && \
    pip install --upgrade setuptools && \
    pip install -r /root/requirements.txt
