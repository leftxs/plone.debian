FROM ubuntu:12.04
MAINTAINER Sven Strack

RUN apt-get update
RUN apt-get install -y supervisor build-essential wget libssl-dev libxml2-dev libxslt1-dev libbz2-dev zlib1g-dev python-setuptools python-dev libjpeg62-dev libreadline-dev python-imaging wv poppler-utils


RUN useradd plone -d /usr/local/Zeo -s /bin/bash
RUN mkdir -p /usr/local/Zeo/
RUN chown -R plone:plone /usr/local/Zeo

# fetch unified installer
USER plone
RUN cd /tmp && wget --no-check-certificate https://launchpad.net/plone/4.3/4.3.2/+download/Plone-4.3.2-UnifiedInstaller.tgz
RUN tar -xzf /tmp/Plone-4.3.2-UnifiedInstaller.tgz -C /tmp


RUN cd /tmp/Plone-4.3.2-UnifiedInstaller; ./install.sh --password=plone standalone --target=/usr/local/Zeo/

# If you do not want supervisor and and want to see all in fg-mode
#USER plone
#CMD /usr/local/Zeo/zinstance/bin/plonectl fg

USER root
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]


EXPOSE 8080
