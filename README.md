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
```

# Dev Road Map
Avoid dependencies and installs as this keeps it light weight and compatible.

#### Minimum Viable Product
1. Color. randomize at each start, or during. flags for this? tput setaf 1; echo "this is red text" https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
--color=<color> or --color=random or...
2. --path ~/<path_to_song.mp3>
3. tmux pipe command to change color
4. multiplayer mode
5. 'text' is separate files, had many problems with this (margins, line breaks)



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