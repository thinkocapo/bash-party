# Stops system/com.apple.audio.coreaudiod upon EXIT (ctrl+c termination)
function stop_music {
  kill 0
}
trap stop_music EXIT

usage() {
    echo  "$0: you did not pass an index"
}

# Get the --index passed from command-line
# TODO scoping OR if no index set, then set it to 0 (after the while loop ends)
export index=0
while [ $# -gt 0 ]; do
                case $1 in
                        --index | -index)       shift
                                                index=$1
                                                ;;
                        --random)               index=7
                                                ;;
                        * )                     usage
                                                exit
                esac
                shift
done
echo $index

play_music() {
        SONGS=()
        for file in ./songs/*; do
                SONGS+=("$(basename "$file")")
        done

        # ?
        # if (--index=random) randomize

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


