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
export color = false

while [ $# -gt 0 ]; do
                case $1 in
                        --index | -index)       shift
                                                INDEX=$1
                                                ;;
                        --random)               ((lastSong = NUM_SONGS - 1))
                                                INDEX=`shuf -i 0-${lastSong} -n 1`
                                                ;;
                        --color)                color=true
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
setColor() {
        if [ $color = true ]:
                then
                        randomColor=`shuf -i 0-7 -n 1`
                        tput setaf $randomColor
        fi
}
flash_text_sentry() {
        for i in {100..1}
                do
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
flash_text_argument() {
        for i in {100..1}
                do
                        clear
                        setColor
                        echo 'thing'
                        echo 'thing'
                        echo 'thing'
                        echo 'thing'
                        sleep 0.05
                        clear
                        sleep 0.05
        done
}
run() {
        play_music
        flash_text_sentry
        # flash_text_argument
}

run
