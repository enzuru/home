#!/usr/bin/env python3

import os
import sys
from os.path import expanduser, join

path = os.environ.get('XDG_CONFIG_HOME')
if not path:
    path = expanduser("~/.config")
else:
    path = expanduser(path)
fn = join(path, 'pianobar', 'nowplaying')

lines = sys.stdin.readlines()
cmd = sys.argv[1]

if cmd == 'songstart':
    with open(fn, 'w') as f:
        title = None
        artist = None
        for line in lines:
            if "title" in line:
                split = line.split("=")
                title = split[1]
            elif "artist" in line:
                split = line.split("=")
                artist = split[1]
        if title and artist:
            nowplaying = "{} - {}".format(artist, title).replace("\n", "")
            f.write(nowplaying)

if cmd == 'songfinish':
    with open(fn, 'w') as f:
        f.write("")
