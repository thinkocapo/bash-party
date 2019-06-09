# bash-party-scripting
[link_to_image or giffy_video]

### Setup
1. create empty songs directory `mkdir songs`
2. Place your mp3's in ./songs
3. run the boom script :)
``` bash
# plays the first song in the directory
`./boom.sh`

# index of song in songs array, from /songs directory
./boom.sh --index 2

# plays a random song from /songs directory
./boom.sh --random

# 
./boom.sh --path ~/Music/down_rodeo.mp3

# adds COLOR
./boom.sh --color
```

### Features
- random song
- color...
- ...?

# Dev Road Map
Avoid dependencies and installs as this keeps it light weight and compatible.

#### Minimum Viable Product
1. --path ~/<path_to_song.mp3>
2. multiplayer mode YEAH!!!!
3. tmux pipe command to change color
4. 'text' is separate files, had many problems with this (margins, line breaks)



#### Ideas
- comes with 1 default song? lookup 'sharing/storing mp3's in github' too big? privacy/license issue?  

- flash_text calling .sh that defines echo-text, repeatedly, is performance issue? seems odd to keep calling multiple scrips like this...per second.

- Makefile. `make boom` wasn't working

- "multiplayer" curl download a script that...installs/runs (i.e. opens a terminal? /bin/bash or other. serve from my.ip.address:PORT
- Ascii Art Generator Dependency called 'figlet'
https://www.shellhacks.com/create-ascii-text-banner-linux-command-line/ 
--name will use figlet, but this is OPTIONAL. and it takes PRECEDENCE over the `echo 'text'` inside the text shell function 
./boom.sh --text=WAZZAP. nah hold off for now, still might not render correctly?
or would be good for repeating 1 single fontsize12 timesnewRoman word many times 
- electron app? too many dependencies? reslies more on native OS? differences in OS/local dev environments may
- dictionary or map file of songs
```
{
    1: '<path_to_your.mp3>',
    2: './songs/rock_jam.mp3'
}
1 <path_to_your.mp3>
2 ./songs/rock_jam.mp3
```

## Troubleshooting
#### Song stuck on run? Try
``` bash
ps aux | grep '<part_of_song_mp3_name>'
kill <pid>
```


#### Gotcha's
``` bash
echo 'lastElement is $lastElement'
# lastElement is $lastElement

echo "lastElement is $lastElement"
# 7
```



whaaaat


set -x			# activate debugging from here
w #good if not sure what w gonna do
set +x			# stop debugging from here

experiment with...?
set -f	set -o noglob	Disable file name generation using metacharacters (globbing).
set -v	set -o verbose	Prints shell input lines as they are read.
set -x	set -o xtrace	Print command traces before executing command.


https://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_06.html
Additionally it shows all the services started up in runlevel 3 on your system. (hint: use HOME, TERM and ls /etc/rc3.d/S*) ?


^^
"Make errors in your script: see what happens if you misspell commands, if you leave out the first line or put something unintelligible there, or if you misspell shell variable names or write them in lower case characters after they have been declared in capitals. Check what the debug comments say about this."