# executes upon EXIT (ctrl+c termination) of boom.sh # system/com.apple.audio.coreaudiod
function stop_music {
  kill 0
}
trap stop_music EXIT

play_music() {
        SONGS=()
        for file in ./songs/*; do
                SONGS+=("$(basename "$file")")
        done
        # if (cli arg for song index is set, then use that song)
        SONG_NAME="${SONGS[0]}"
        # else { select songs[0] default }
        afplay "./songs/$SONG_NAME" &>/dev/null &
}

run() {
        play_music
        # TEXT=$(cat text.txt)
        # TEXT=`~/projects-beta/sentry-echo-timer/dep/text.sh`
        for i in {100..1}
        do
                clear
                # echo $TEXT
                ~/projects-beta/sentry-echo-timer/text.sh
                ~/projects-beta/sentry-echo-timer/text.sh
                ~/projects-beta/sentry-echo-timer/text.sh
                ~/projects-beta/sentry-echo-timer/text.sh
                # text
                # text
                # text
                # text
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

run


