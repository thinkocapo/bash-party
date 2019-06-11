# Will's server hosts `127.0.1.43/bashparty.sh` but this needs to open a Terminal and open everything below...
# `curl 127.0.1.43/bashparty.sh` would be easier because they could open Terminal first...?

# HOW .sh that calls Terminal (binary, executable) and passes a script for it to run open opening?

# SETUP
# Make a ./ songs Directory
mkdir songs
touch songs/first_songs.mp3

# GET A SONG
# Check if mp3 already in /songs. If not, then...
        # Will 127.0.1.241/song endpoint`send_file` https://pythonprogramming.net/flask-send-file-tutorial/
        # returns full song.mp3

######## RESUME AS NORMAL ########
# Stops the process system/com.apple.audio.coreaudiod upon EXIT (ctrl+c termination)
stop_music () {
  kill 0
}
trap stop_music EXIT

warning() {
    echo  "you did pass proper arguments"
}

# Prepare songs from ./songs in an indexed array
SONGS=()
for file in ./songs/*; do
        SONGS+=("$(basename "$file")")
done
NUM_SONGS=${#SONGS[*]}

# Select a song by it's index, randomize or colorize
export INDEX=0
while [ $# -gt 0 ]; do
                case $1 in
                        --index | -index)       shift
                                                INDEX=$1
                                                ;;
                        --random)               ((lastSong = NUM_SONGS - 1))
                                                INDEX=`shuf -i 0-${lastSong} -n 1`
                                                ;;
                        --color)                color=`shuf -i 0-7 -n 1`
                                                tput setaf $color
                                                ;;
                        * )                     warning
                                                exit
                esac
                shift
done


play_music() {
        SONG_NAME="${SONGS[INDEX]}"
        afplay "./songs/$SONG_NAME" &>/dev/null &
}

text() {
        echo '███████╗███████╗███╗   ██╗████████╗██████╗ ██╗   ██╗██╗ ██████╗
██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔══██╗╚██╗ ██╔╝██║██╔═══██╗
███████╗█████╗  ██╔██╗ ██║   ██║   ██████╔╝ ╚████╔╝ ██║██║   ██║
╚════██║██╔══╝  ██║╚██╗██║   ██║   ██╔══██╗  ╚██╔╝  ██║██║   ██║
███████║███████╗██║ ╚████║   ██║   ██║  ██║   ██║██╗██║╚██████╔╝
╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝╚═╝╚═╝ ╚═════╝'
        echo ''
}
flash_text() {
        for i in {100..1}
                do
                        clear
                        text
                        text
                        text
                        text
                        sleep 0.05
                        clear
                        sleep 0.05
        done
}

run() {
        play_music
        flash_text 
}

run
