# stops system/com.apple.audio.coreaudiod upon EXIT (ctrl+c termination)
function stop_music {
  kill 0
}
trap stop_music EXIT

usage1() {
    echo  "$0: some help text"
}

play_music() {
        SONGS=()
        for file in ./songs/*; do
                SONGS+=("$(basename "$file")")
        done

        index=0

        # while [ '$1' != "" ]; do
        #         case $1 in
        #                 --index | -index)       shift
        #                                         filename=$1
        #                                         ;;
        #                 -i | --interactive )    interactive=1
        #                                         ;;
        #                 -h | --help )           usage
        #                                         exit
        #                                         ;;
        #                 * )                     usage1
        #                                         exit 1
        #         esac
        #         shift
        # done
        # echo $filename

        # if (--index) index=--index


        # ?
        # if (--index=random) randomize

        SONG_NAME="${SONGS[index]}"
        afplay "./songs/$SONG_NAME" &>/dev/null &
}

run() {
        play_music
        flash_text
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
        # echo...
        # TEXT=$(cat text.txt)
        # TEXT=`~/projects-beta/sentry-echo-timer/dep/text.sh`

        for i in {100..1}
                do
                        clear
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

run


