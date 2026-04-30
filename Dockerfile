# syntax=docker/dockerfile:1

FROM python:3.13
WORKDIR /
RUN apt-get -y update && apt-get -y upgrade && mkdir /source && mkdir -p /root/.local/share/streamlink/plugins && mkdir /recordurbate-streamlink && mkdir /recordurbate-streamlink/videos && apt-get -y install apt-utils && pip install streamlink && pip install requests && pip install urllib3
COPY files/recordurbate-streamlink source/ 
COPY files/rbs-start.sh /
COPY files/recordurbate-streamlink/chaturbate.py /root/.local/share/streamlink/plugins/
VOLUME /recordurbate-streamlink /recordurbate-streamlink/videos
RUN chmod +x /rbs-start.sh
CMD ["/rbs-start.sh"]
