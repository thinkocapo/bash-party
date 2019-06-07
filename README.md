# sentry-echo-script

# Dev RoadMap
### Minimum Viable Product
1. flag for randomizer vs index for song selection. http://linuxcommand.org/lc3_wss0120.php ./boom.sh for default songs&text, OR ./boom.sh -song 1,2,3,4 --text <text_here>
2. color. randomize at each start, or during. flags for this? tput setaf 1; echo "this is red text" https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
#### TBD
3. comes with 1 default song? lookup 'sharing/storing mp3's in github' too big? privacy/license issue?
4. help with text to separate file
5. tmux. splitting. piping... updating the text on the go...env var for colors...updating a shell env by command from a different shell.
6. Makefile? command you call at anytime to number the songs ;) unecessary, overkill? unless Make can makeup for .sh scripts executing differently between systems
7. error handling? sentry somehow? at the very least, have it written to a log file? is there a standard practice for shell scripts?
8. pointers to songs? see Setup

### Setup
Three different approaches
#### /songs directory
put all songs into ./songs and script write(s) the number (or filename?) of the song? or users can re-name them numerically like 1_cake_the_distance.mp3, 2_offspring_gone_away.mp3. some kind of container to place these in?
#### pointer to songs
songs.txt with SONG1=jdilla_donuts.mp3
songs.txt with SONG2=the_offspring_gone_away.mp3
#### json dictionary for songs
{
    1: '~/path_to/jdilla_donuts.mp3',
    2: '~/Music/the_offspring_gone_away.mp3'
    3: '3842_is_the_song.mp3'
    4: '',
    5: ''
}

- could also put them in ./songs, and then reference that relative path (but this would feel like extra step).
- **^^ maybe have it default check SONG=$SONG_PATH or the json dictionary, as well as /songs, in some order**
- BENEFIT of not needing apt-installs, Node, Python, is that its lighter weight, more compatible, and want that anyone could run it it...?
- TEST THIS^^ by giving it to other devs.


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