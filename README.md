plone.docker
============

deploying plone for testing on/with docker, watchout this is without a persistent data dir, you can choose in the Dockerfile if you want to use supervisor or not.
Supervisor is installed via system packages not via buildout.

- download Dockerfile
- build it:
    docker build --rm -t plone-test .
- run it:
    docker run --name plone1 -p 8080:8080 -p -i -t plone-test

- run it detached:
    docker run --name plone2 -p 8080:8080 -t -d plone-test

Todo: Update to 14.04 and make it nice...
