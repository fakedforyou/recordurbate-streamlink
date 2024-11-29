import json
import os
import re
from bot import Bot
from daemon import Daemon

json_file = open("configs/config.json")
json_info = json.load(json_file)
logger = None
b = Bot(logger)
d = Daemon()
streamer_list = []

def print_status(streamer):
    if b.is_online(streamer):
        print(streamer + " is online")
    else:
        print(streamer + " is offline")

def print_recording():
    command = os.popen('ps -aux | grep chaturbate').read()
    output_list = command.split()
    recording_list = []
    for output in output_list:
        if "chaturbate.com" in output:
            recording_list.append(output)
            
    for streamer in recording_list:
        streamer = re.sub('https://chaturbate.com/', '', streamer)
        streamer = streamer[:-1] # remove last character from string
        print(streamer + " is being recorded")
    
    print("")
    
if d.read_pid():
    print("Daemon is running\n")
    print("Note:\nRunning this script multiple times in a very short amount of "
    + "time makes Cloudflare think you are a bot.\nThis will stop you from seeing who is online and offline."
    + "\nOnce you run this, wait around a minute or more before running it again.\n")

    for streamer in json_info['streamers']:
        streamer_list.append(streamer)
        
    print_recording()

    for streamer in streamer_list:
        print_status(streamer)
else:
    print("Daemon is not running")
