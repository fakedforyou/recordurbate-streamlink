# This is a work in progress - standby

# recordurbate-streamlink Introduction:
Files and instructions to build a recordurbate-streamlink image used to deploy it in docker

This project is based on https://github.com/weigeloveu/Recordurbate-streamlink and uses files from https://github.com/streamlink/streamlink. The intention is to enable you to build a docker image that will capture free streamed content from Chaturbate models for offline viewing in accord with their published authorization. Using this to capture models who do not approve is forbidden and not intended.

# how to build the docker image:
*mkdir -p /recordurbate-streamlink-build

*cd /recordurbate-streamlink-build
*git clone https://github.com/fakedforyou/recordurbate-streamlink.git
*cd recordurbate-streamlink
*docker build -t recordurbate-streamlink:latest .

# how to deploy a container using the image:


# how to add or remove models:


# how to change download quality:


# general usage suggestions:
