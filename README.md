# Dev RoadMap

sentry-echo-script

APPROACH
/songs directory where you put your songs, and put #number of the song you want?
song.txt(?) where you export a song
read value exported by song.txt and this is the mp3 it looks for.


### BASH KNOW-HOW & TECHNICAL FOUNDATION
- passing arguments e.g. -r for 'random' song/color
    http://linuxcommand.org/lc3_wss0120.php
    while $1, case $1 in -f, -host, shift, $1
- feed text from file
- Makefile? command you call at anytime to number the songs ;)
- error handling? sentry somehow?

### FEATURES
- song, flag for randomizer, flag for song selection
    - "put your song in here(?) or a path to it..."?
- color. randomize at each start, or during. flags for this?
COLORED TEXT...
tput setaf 1; echo "this is red text"
https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
- default variable/file setting for username
- comes with 1 default song? lookup 'sharing/storing mp3's in github' too big? privacy/license issue?


./boom.sh for default selection of songs/text, OR
./boom.sh -song 1,2,3,4... --text <text_here>
make


2 APPROACHES....

write filenames of the songs here...(AND PASTE THEM INTO PROJECT)
#export SONG=~/path_to/the_songs_name.mp3
#export SONG=another_song_name.mp3
export SONG=you_get_songd.mp3

OR

put all songs into ./songs
write the number (or filename?) of the song.


### Setup
Loop over files in a directory? cool but can't guarantee order....nor want to require physical pasting files to there...

<songs.txt>
# This file will get read by boom.sh (make). picks the first, or set random flag...
# 1
~/path_to/3842_is_the_song.mp3
# 2
~/path_to/dance_hits.mp3
# or place some mp3's in this project's songs directory
./songs/another_song_#$@.mp3

/songs

1| song1.mp3
2| another_song_#$@.mp3
3| 3842_is_the_song.mp3
4|
5|

// Meh...
// json in a shell file? ah, could run Node. NO should not have dependency on that...
// would need apt-get install jq https://linuxhint.com/bash_jq_command/
{
    1: 'song1.mp3',
    2: 'another_song_#$@.mp3'
    3: '3842_is_the_song.mp3'
    4: '',
    5: ''
}

feel free to put them in ./songs and then reference that relative path


BENEFIT of not needing Node, Python, apt-install(s),,,,ANYONE can run it...? TEST IT!!!!


### Troubleshooting
Song stuck on run? Try
``` bash
ps aux | grep '<part_of_song_mp3_name'
kill <pid>
```


### IDEA
install script which you can 'curl' so it:
downloads and runs (i.e. opens a terminal? find /bin/bash OR other..., runs script) (serve the script on from localhost so others can DL it from my.ip.address:PORT)
or
turns it into an electron app?
might be too many dependencies, and relying on native OS. differences in OS/local dev environments may cause inconsistencies? well not for developing code; a finished Desktop Electron App should work fine? this is much heaver though