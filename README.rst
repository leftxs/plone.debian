plone.docker
============

This is an example for running one basic plone instance inside `docker container <http://docker.io>`_.
**Do not use that in production**.

Example
=======

.. code-block:: bash

    git clone https://github.com/leftxs/plone.docker.git

    docker build -t plone-docker .

    docker run -d --name plone-test -p 8080:8080 plone-docker

.. todo:: make this a trusted build and push it to docker hub


Data
====

Out of the box this image does not use persistent data store. meaning next time you [re]start this container, **your
data will be lost !**

Persistent data
~~~~~~~~~~~~~~

Do keep data, mount a directory from your host, make sure that this
dir exists and check the permissions, you will need read+write....

Make sure to create the dirs and subdirs, like

.. code-block:: bash

    mkdir site-data
    mkdir site-data/log

Run docker

.. code-block:: bash

    docker run --name plone1 -d-v /home/svx/Projects/docker/plone.host.data/site-data:/data -p 8080:8080 plone-docker

this will mount /home/svx/Projects/docker/plone.host.data/site-data from our
host into /data from our container.

You are now able to check all your files in /home/svx/Projects/docker/plone.host.data/site-data

.. todo:: use nicer buildout, maybe the 'official' UI one ?
