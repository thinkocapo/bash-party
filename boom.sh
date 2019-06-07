# cleanup executes upon EXIT (termination, ctrl+c) of the script
function cleanup {
  echo "Stopping system/com.apple.audio.coreaudiod"
  kill 0
}
trap cleanup EXIT

play_song() {

        # TODO pulls first in directory OR -songIndex parameter from cli
        SONGS=()
        for file in ./songs/*; do
                SONGS+=("$(basename "$file")")
        done

        SONG_NAME="${SONGS[2]}"

        # TODO
        #  if (SONG_NAME.isSet()) play SONG_NAME) else PLAY DEFAULT

        afplay "./songs/$SONG_NAME" &>/dev/null &
}

run() {
        clear
        for i in {100..1}
        do
                clear
                flash_text
                echo ''
                flash_text
                echo ''
                flash_text
                echo ''
                flash_text

                sleep 0.05
                clear
                sleep 0.05
        done
}

flash_text() {
        echo '███████╗███████╗███╗   ██╗████████╗██████╗ ██╗   ██╗██╗ ██████╗
██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔══██╗╚██╗ ██╔╝██║██╔═══██╗
███████╗█████╗  ██╔██╗ ██║   ██║   ██████╔╝ ╚████╔╝ ██║██║   ██║
╚════██║██╔══╝  ██║╚██╗██║   ██║   ██╔══██╗  ╚██╔╝  ██║██║   ██║
███████║███████╗██║ ╚████║   ██║   ██║  ██║   ██║██╗██║╚██████╔╝
╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝╚═╝╚═╝ ╚═════╝'
}

play_song
run


