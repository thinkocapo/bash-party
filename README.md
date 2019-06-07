# sentry-echo-script

### Setup
1. Place a .mp3 in ./songs directory
2. `./boom.sh`

# Dev Road Map
- Remember, there's a benefit of not needing apt-installs, Node, Python, is that its lighter weight, more compatible, and want that anyone could run it it? test this, give to someone else  

**Minimum Viable Product**  
still needs...
1. Flag for randomizer vs index for song selection. http://linuxcommand.org/lc3_wss0120.php ./boom.sh for default songs&text, OR ./boom.sh -song 1,2,3,4 --text <text_here>
2. Color. randomize at each start, or during. flags for this? tput setaf 1; echo "this is red text" https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

## Optional Dev Items, TBD
#### Song selection order based on the options in in Setup?
Three different approaches for this:
#### /songs directory
put all songs into ./songs and script write(s) the number (or filename?) of the song? or users can re-name them numerically like 1_cake_the_distance.mp3, 2_offspring_gone_away.mp3. some kind of container to place these in?
#### pointer to songs
songs.txt with SONG1=jdilla_donuts.mp3
songs.txt with SONG2=the_offspring_gone_away.mp3
#### json dictionary for songs
```
{
    1: '<path_to_your_mp3>',
    2: '~/Music/the_offspring_gone_away.mp3',
    3: '~/path_to/jdilla_donuts.mp3',
    4: '3842_is_the_song.mp3',
    5: ''
}
```
#### other
- comes with 1 default song? lookup 'sharing/storing mp3's in github' too big? privacy/license issue?  
- Help with text defined in separate file. it was losing margins and line breaks.  
- tmux. splitting. piping. updating the text on the go. e.g. env var for colors. Updating a shell env by command from a different shell?  
- Makefile? command you call at anytime to number the songs ;) unecessary, overkill? unless Make can makeup for .sh scripts executing differently between systems  
- error handling? sentry somehow? at the very least, have it written to a log file? is there a standard practice for shell scripts?  
- pointers to songs? see Setup
- curl download a script that...installs/runs (i.e. opens a terminal? /bin/bash or other. serve from my.ip.address:PORT
- electron app? too many dependencies? reslies more on native OS? differences in OS/local dev environments may

## Troubleshooting
Song stuck on run? Try
``` bash
ps aux | grep '<part_of_song_mp3_name'
kill <pid>
```
