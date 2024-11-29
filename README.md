# This is a work in progress - standby

# recordurbate-streamlink Introduction:
Files and instructions to build a recordurbate-streamlink image used to deploy it in docker

This project is based on https://github.com/weigeloveu/Recordurbate-streamlink and uses files from https://github.com/streamlink/streamlink. And so thank you @weigeloveu and @streamlink for your awesome content.

The intention here is to enable you to build a docker image that will capture free streamed content from Chaturbate models for offline viewing in accord with their published authorization. 

> [!CAUTION]
> Using this to capture models who do not approve or who have copyright expressed for their streaming content is forbidden and not intended by this project. DO NOT DOWNLOAD these models.


> [!NOTE]
> In the same instructions below all content is done completely off of root \/ . This is not typically advised and is better under opt, home, or some other place. Please adjust the directories used as you see fit for your system.
> 
# how to build the docker image:
First we make a directory, move into it, get this git content, move into that, and then build the image.
```
mkdir -p /recordurbate-streamlink-build
cd /recordurbate-streamlink-build
git clone https://github.com/fakedforyou/recordurbate-streamlink.git
cd recordurbate-streamlink
docker build -t recordurbate-streamlink:latest .
```
(don't forget the trailing dot)

# how to deploy a container using the image:
Make some directories used for the configuration files and to hold the videos.
```
mkdir -p /rbs-config
mkdir -p /rbs-videos
```

Now lets make and start our docker container. 
```
docker run -d \\ \
  --restart unless-stopped \\ \
  --name recordurbate-streamlink \\ \
  -e PGID=0 -e PUID=0 \\ \
  -e UMASK_SET=000 \\ \
  -v /rbs-config:/recordurbate-streamlink \\ \
  -v /rbs-videos:/recordurbate-streamlink/videos \\ \
recordurbate-streamlink:latest
```

# how to add or remove models:
cd /rbs-config/configs

nano ./config.json

modify the file so that it is similar to this using the model names:

**********************
{\
    "auto_reload_config": true,\
    "rate_limit": true,\
    "rate_limit_time": 5,\
    "default_export_location": "./list.txt",\
    "streamers": [\
        "model-1",\
        "model-2",\
        "model-3"\
    ]\
}

*********************

An example with proper spacing for JSON is in the extras folder.

# how to change download quality:


# general usage suggestions:
