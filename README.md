# bash-party-scripting
link_to_image or giffy_video
### Setup
1. Place a .mp3 in ./songs directory
2. `./boom.sh`
optional

# Dev Road Map
- Remember, there's a benefit of not needing apt-installs, Node, Python, is that its lighter weight, more compatible, and want that anyone could run it it? test this, give to someone else  

**Minimum Viable Product**  
1. http://linuxcommand.org/lc3_wss0120.php ./boom.sh 
--randomize or --index=n
--index=random or --index=<n>
Precedence


2. Color. randomize at each start, or during. flags for this? tput setaf 1; echo "this is red text" https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
--color=<color> or --color=random

## Optional Dev Items, TBD
*hold off. dragging-dropping mp3's is normal, expected, with audio players. but would be cool to "pointer" to the mp3 location? hmm*
### Song selection order based on the options in in Setup?
Three different approaches for this
(and pass --path-to-song=~/$MY_MUSIC/song.mp3 takes precedence)
#### /songs directory
put all songs into ./songs and script write(s) the number (or filename?) of the song? or users can re-name them numerically like 1_cake_the_distance.mp3, 2_offspring_gone_away.mp3. some kind of container to place these in?
#### pointer to songs
songs.txt with SONG1=~/<path_to>/jdilla_donuts.mp3
songs.txt with SONG2=~/Music/the_offspring_gone_away.mp3
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
- how can inner scope functions access $1 command-line passed args (global?)?
- comes with 1 default song? lookup 'sharing/storing mp3's in github' too big? privacy/license issue?  
- tmux. splitting. piping. updating the text on the go. e.g. env var for colors. Updating a shell env by command from a different shell?
- flash_text calling .sh that defines echo-text, repeatedly, is performance issue? seems odd to keep calling multiple scrips like this...per second.

- 5:19p NOT for now...
figlet
https://www.shellhacks.com/create-ascii-text-banner-linux-command-line/ 
--name will use figlet, but this is OPTIONAL. and it takes PRECEDENCE over the `echo 'text'` inside the text shell function 
./boom.sh --text=WAZZAP. nah hold off for now, still might not render correctly?
or would be good for repeating 1 single fontsize12 timesnewRoman word many times 
- Help with text defined in separate file. it was losing margins and line breaks.  
- Makefile? command you call at anytime to number the songs ;) unecessary, overkill? unless Make can makeup for .sh scripts executing differently between systems  
- error handling? sentry somehow? at the very least, have it written to a log file? is there a standard practice for shell scripts?  
- curl download a script that...installs/runs (i.e. opens a terminal? /bin/bash or other. serve from my.ip.address:PORT
- electron app? too many dependencies? reslies more on native OS? differences in OS/local dev environments may

## Troubleshooting
Song stuck on run? Try
``` bash
ps aux | grep '<part_of_song_mp3_name'
kill <pid>
```
