# Stops system/com.apple.audio.coreaudiod upon EXIT (ctrl+c termination)
function stop_music {
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
num_songs=${#SONGS[*]}

# Select a song (index) based on argument passed to boom.sh script
export index=0
while [ $# -gt 0 ]; do
                case $1 in
                        --index | -index)       shift
                                                index=$1
                                                ;;
                        --random)               ((lastSong = num_songs - 1))
                                                index=`shuf -i 0-${lastSong} -n 1`
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
        SONG_NAME="${SONGS[index]}"
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
