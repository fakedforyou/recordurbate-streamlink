# Recordurbate-streamlink
A Bot to automatically record Chaturbate live streams (using streamlink).

<a href="https://github.com/oliverjrose99/Recordurbate/issues/39">Why use streamlink?</a>
### Original
https://github.com/oliverjrose99/Recordurbate
## Requirements
* Linux
* Python 3+ (requests)
* python3-setuptools
* Streamlink (with chaturbate plugin)
## Installation
```commandline
git clone https://github.com/streamlink/streamlink.git
git clone https://github.com/botnet88/Recordurbate-streamlink.git
cp Recordurbate-streamlink/chaturbate.py streamlink/src/streamlink/plugins/
cd streamlink
sudo python3 setup.py install
```
### Note
If you already have streamlink installed, you don't need to build it. Sideload the plugin instead. Put chaturbate.py in the directory specified <a href="https://streamlink.github.io/cli.html#sideloading-plugins">here</a> for your system.
## Usage

View the usage/help text
```
./Recordurbate help
```

Check who is online, and view list of currently downloading streams
```
./status.py
```

Add or remove a streamer to record
```
./Recordurbate.py [add | del] username
```

Start, stop or restart the daemon
```
./Recordurbate.py [start | stop | restart]
```

List the streamers in the config
```
./Recordurbate list
```

Import streamers from a file
```
./Recordurbate import [file]
```

Export streamers to a file. The file parameter is optional and the default location will be used if not passed
```
./Recordurbate.py export [file]
```
