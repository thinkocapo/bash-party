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
# export argz=$# didnt' work...
SONGS=()
for file in ./songs/*; do
        SONGS+=("$(basename "$file")")
done
length=${#SONGS[*]}

export index=0
while [ $# -gt 0 ]; do
                case $1 in
                        --index | -index)       shift
                                                index=$1
                                                ;;
                        --random)               length=${#SONGS[*]}
                                                ((lastElement = length - 1))
                                                # echo $lastElement
                                                echo 'lastElement is "$lastElement"' # ?
                                                index=`shuf -i 0-${lastElement} -n 1`
                                                # more readable way for random number generation? modularize at least?
                                                ;;
                        * )                     usage
                                                exit
                esac
                shift
done
echo $index

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
        # flash_text
}
run


