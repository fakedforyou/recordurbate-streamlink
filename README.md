# UPDATES:
* 2025-03-13 Modified chaturbate.py to reflect variable changes
* 2025-01-23 Modified the Dockerfile to include a CHMOD statement. This worked fine without it on one of my systems but when trialing it on another I had the issue that this fixed. Hopefully it fixes it for you too
* 2025-01-23 Updated the docker run command to include access to time and timezone so downloaded files match your system time.

  
# recordurbate-streamlink with docker introduction:
Files and instructions to build a recordurbate-streamlink image used to deploy it in docker

This project is based on https://github.com/weigeloveu/Recordurbate-streamlink and uses files from https://github.com/streamlink/streamlink. And so thank you @weigeloveu and @streamlink for your awesome content.

The intention here is to enable you to build a docker image that will capture free streamed content from Chaturbate models for offline viewing in accord with their published authorization. 

> [!NOTE]
> In the sample instructions below all content is done completely off of root \/ . This is not typically advised and is better under opt, home, or some other place. Please adjust the directories used as you see fit for your system.

> [!CAUTION]
> Using this to capture models who do not approve or who have copyright expressed for their streaming content is forbidden and not intended by this project. DO NOT DOWNLOAD these models. While it will work for all except private show in progress streams it is not endorsed nor recommended. 

# how to build the docker image:
First of all the assumption is you have docker installed and functional on your system. Once you have this done make a directory, move into it, get this git content, move into that, and then build the image as per below:
```
mkdir -p /recordurbate-streamlink-build
cd /recordurbate-streamlink-build
git clone https://github.com/fakedforyou/recordurbate-streamlink.git
cd recordurbate-streamlink
docker build -t recordurbate-streamlink:latest .
```
(don't forget the trailing dot)

This build process can take a while as the image is almost 2GB. Perhaps I could have pruned it down but thats for another time. Once the image is made you can verify it by typing this from your bash prompt:
```
docker image ls
REPOSITORY                                      TAG       IMAGE ID       CREATED        SIZE
recordurbate-streamlink                         latest    rb953335e273   32 hours ago   1.87GB
```
Note the 1.87GB size and that the image is there!

# how to deploy a container using the image:
Make some directories used for the configuration files and to hold the videos.
```
mkdir -p /rbs-config
mkdir -p /rbs-videos
```

Now lets make and start our docker container. 
```
docker run -d \
  --restart unless-stopped \
  --name recordurbate-streamlink \
  -e PGID=0 -e PUID=0 \
  -e UMASK_SET=000 \
  -v /rbs-config:/recordurbate-streamlink \
  -v /rbs-videos:/recordurbate-streamlink/videos \
  -v /etc/timezone:/etc/timezone \
  -v /etc/localtime:/etc/localtime \
recordurbate-streamlink:latest
```

# how to add or remove models:
Models are identified in the config.json file within the configs directory in your /rbs-config directory. To add or remove models it is easiest to just modify the JSON file. You can also add models by attaching to the container and running the familiar recordurbate add command. But the file is faster and actually easier as long as you maintain the spacing and syntax. This file is periodically read and so there is no need to restart the container for the changes to take effect. 
```
cd /rbs-config/configs
```

Edit the file with nano, vi, xed, or whatever you like.
```
nano ./config.json
```

Modify the file so that it is similar to this using the model names:
```
{
    "auto_reload_config": true,
    "rate_limit": true,
    "rate_limit_time": 5,
    "default_export_location": "./list.txt",
    "streamers": [
        "firstmodel",
        "secondmodel",
        "thirdmodel"
    ]
}
```

An example with proper spacing for JSON is in the extras folder. Note that the last model does not have a comma after the quote. I try to add them alphabetically.

# how to change download resolution:
By default the recording is done at 480p and as an MP4. You can view videos as they're downloading by just opening the MP4! The resolution is determined by a line in the /rbs-config directory called bot.py that looks like this:
```
"480p,720p,best",
```

To change the resolution just modify this line to something else. Some examples are:
```
"1080p,720p,best",
or
"720p,480p,best", I use this one
or
"best,720p,480p",
or something else
```
There is a sample in the extras folder. Changing this does require a restart of the container for the changes to take effect.

# general usage suggestions:
coming soon!
