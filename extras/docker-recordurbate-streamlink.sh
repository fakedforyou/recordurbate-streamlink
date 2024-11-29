docker run -d \
  --restart unless-stopped \
  --name recordurbate-streamlink \
  -e PGID=0 -e PUID=0 \
  -e UMASK_SET=000 \
  -v /rbs-config:/recordurbate-streamlink \
  -v /rbs-videos:/recordurbate-streamlink/videos \
recordurbate-streamlink:latest
