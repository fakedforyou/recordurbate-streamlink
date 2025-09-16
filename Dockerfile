# syntax=docker/dockerfile:1

FROM python:3.11
WORKDIR /
RUN apt-get -y update && mkdir /source && mkdir -p /root/.local/share/streamlink/plugins && mkdir /recordurbate-streamlink && mkdir /recordurbate-streamlink/videos && apt-get -y install apt-utils && pip install streamlink==5.2.1 && pip install requests && pip install "urllib3<2"
COPY files/recordurbate-streamlink source/ 
COPY files/rbs-start.sh /
COPY files/recordurbate-streamlink/chaturbate.py /root/.local/share/streamlink/plugins/
VOLUME /recordurbate-streamlink /recordurbate-streamlink/videos
RUN chmod +x /rbs-start.sh
CMD ["/rbs-start.sh"]
