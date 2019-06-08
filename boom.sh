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
        #index=0
        # if (--index exists or is numerical, index=param)
        # if (--index=random) randomize
        SONG_NAME="${SONGS[0]}"

        # else { select songs[index] default }
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
                # ~/projects-beta/sentry-echo-timer/text.sh
                # ~/projects-beta/sentry-echo-timer/text.sh
                # ~/projects-beta/sentry-echo-timer/text.sh
                # ~/projects-beta/sentry-echo-timer/text.sh
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

run


