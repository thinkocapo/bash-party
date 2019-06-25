# bash-party-scripting
[link_to_image or giffy_video]

### Setup
1. `git clone git@github.com:thinkocapo/bash-party-scripting.git`
2. `cd bash-party-scripting`
3. `mkdir songs` directory
4. `cp <your_song>.mp3` into `./songs`

### Run
1. `./boom.sh` script with the following options:
``` bash
# plays first song in the directory
./boom.sh

# adds color
./boom.sh --color

# plays random song from ./songs
./boom.sh --random

# plays 3rd song from ./songs [0,1,2]
./boom.sh --index 2

# plays song by path
./boom.sh --path ~/Music/down_rodeo.mp3

```

### Notes
- Ascii Art Generator Dependency called 'figlet'
https://www.shellhacks.com/create-ascii-text-banner-linux-command-line/
- ./boom.sh --text=WAZZAP
or would be good for repeating 1 single fontsize12 timesnewRoman word many times



### Troubleshooting
#### Song stuck on run? Try
``` bash
ps aux | grep '<part_of_song_mp3_name>'
kill <pid>
```
#### debugging the script
set -f	set -o noglob	# Disable file name generation using metacharacters (globbing).
set -v	set -o verbose	# Prints shell input lines as they are read.
set -x	set -o xtrace	# Print command traces before executing command.
#### note
`afplay` is Mac only.


#### Server?
1. server
TODO server.py didn't work, only app.py?
```
source ~/virtualenvs/bash_party/bin/activate
FLASK_APP=server.py
flask run -p 5001
```
2. client (wants install)
Open Terminal
`curl http://127.0.0.1:5001/download | bash`



TODO
--text textyouwanttoappear
^^ try once more