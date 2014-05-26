plone.docker
============

deploying plone for testing on/with docker, watchout this is without a persistent data dir

- download Dockerfile
- build it:
    docker build --rm -t plone-test .
- run it:
    docker run --name plone1 -p 8080:8080 -p -i -t plone-test

- run it detached:
    docker run --name plone2 -p 8080:8080 -t -d plone-test
