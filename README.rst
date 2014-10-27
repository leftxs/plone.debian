plone.docker
============

This is a build for Plone on docker, this is just an example, **do not use it
in production**

- clone it
- build it: docker built -t plone-docker .
- run it: docker run -d --name plone-test -p 8080:8080 plone-docker

persistent data store
=====================

is you do not use persistent data store, you data will be lost with the next
start ....

We are lazy, meaning we 'just' mount a dir from our host, make sure that this
dir exists and check the permissions, you will need read+write....

docker run --name plone1 -d-v /home/svx/Projects/docker/plone.host.data/site-data:/data -p 8080:8080 debian-plone

this will mount /home/svx/Projects/docker/plone.host.data/site-data from our
host into /data from our container.

You are now able to check all your files in /home/svx/Projects/docker/plone.host.data/site-data

todo: use nicer buildout, maybe the 'official' UI one ?
