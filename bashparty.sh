# Stops the process system/com.apple.audio.coreaudiod upon EXIT (ctrl+c termination)
stop_music () {
  kill 0
}
trap stop_music EXIT

warning() {
    echo  "you didn't pass proper arguments"
}

# Prepare songs from ./songs in an indexed array
SONGS=()
for file in ./songs/*; do
        SONGS+=("$(basename "$file")")
done
NUM_SONGS=${#SONGS[*]}

# Select a song by it's index, randomize or colorize
export INDEX=1
export color=false
export TEXT=""
while [ $# -gt 0 ]; do
                case $1 in
                        --index)       shift
                                                INDEX=$1
                                                ;;
                        --random)               ((lastSong = NUM_SONGS - 1))
                                                INDEX=`shuf -i 1-${lastSong} -n 1`
                                                ;;
                        --color)                color=true
                                                ;;
                        --text)                 shift
                                                TEXT=$1
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
setColor() {
        if [ "$color" = true ]
        then
                randomColor=`shuf -i 0-7 -n 1`
                tput setaf $randomColor
        fi
}
strobe_light() {
        while true; do 
	        clear
                setColor
                text
                text
                text
                text
                sleep 0.05
                clear
                sleep 0.05
        done
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


run() {
        play_music
        strobe_light
}
run
