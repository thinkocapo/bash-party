# cleanup executes upon EXIT (termination, ctrl+c) of the script
function cleanup {
  echo "Stopping system/com.apple.audio.coreaudiod"
  kill 0
}
trap cleanup EXIT

play_song() {
        # prepare songs array
        SONGS=()
        for file in ./songs/*; do
                SONGS+=("$(basename "$file")")
        done

        # if (cli arg for song is set)
        SONG_NAME="${SONGS[2]}"
        # else { select songs[0] }

        afplay "./songs/$SONG_NAME" &>/dev/null &
}

run() {
        play_song

        clear
        for i in {100..1}
        do
                clear
                text
                echo ''
                text
                echo ''
                text
                echo ''
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
}

run


