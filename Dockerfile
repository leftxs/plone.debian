FROM debian:jessie
MAINTAINER Sven Strack

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    wget \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libbz2-dev \
    zlib1g-dev \
    python-setuptools \
    python-dev \
    libjpeg62-dev \
    libreadline-dev \
    python-imaging \
    poppler-utils \
    wv \
    locales \
    python-pip \
    supervisor

RUN pip install zc.buildout

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

ENV DEBIAN_FRONTEND newt

RUN useradd zope -d /usr/local/zope -s /bin/bash && \
    mkdir -p /usr/local/zope && \
    chown -R zope:zope /usr/local/zope && \
    mkdir -p /data && \
    chown -R zope:zope /data

USER zope
WORKDIR /usr/local/zope
ADD buildout.cfg /usr/local/zope/
RUN buildout
CMD bin/instance console


EXPOSE 8080

