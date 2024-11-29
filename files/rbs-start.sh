#!/bin/bash
if [ ! -f /recordurbate-streamlink/configs/config.json ]
then
	cp -R /source/* /recordurbate-streamlink/
fi
rm -Rf /recordurbate-streamlink/configs/rb.*
cd /recordurbate-streamlink
#tail -f /recordurbate-streamlink/Recordurbate.py
python3 ./Recordurbate.py start
tail -f /var/log/lastlog
