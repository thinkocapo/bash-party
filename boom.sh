play_song() {
        # TODO - pull values from a directory...? depends, loop?
        # FAVORITES 1,2
        # SONG_NAME='10318616_Control_Extended_Mix.mp3'
        # SONG_NAME='10528769_Sundogs_Original_Mix.mp3'
        # Marco Carola
        SONG_NAME='606870_Get_Set_Original_Mix.mp3'
        # SONG_NAME='10582450_No_Time_For_Hulk_Camelphat_Re_Fix____Erik_Hagleton_2018_Vocal_Edit_.mp3'
        # SONG_NAME='10539951_Dis_One_Original_Mix.mp3'
        # Stacey Pullen
        # SONG_NAME='5152885_Get_Loose_Original_Mix.mp3'
        # SONG_NAME='10158745_Dance___Shout_Original_Mix.mp3'
        # SONG_NAME='Flying\ Lotus\ -\ 05\ -\ Melt\!.mp3'
        # SONG_NAME='606870_Get_Set_Original_Mix.mp3'

        # TODO
        #  if (SONG_NAME.isSet()) play SONG_NAME) else PLAY DEFAULT
        afplay "./songs/$SONG_NAME" &>/dev/null &
}

flash_text() {
        echo '███████╗███████╗███╗   ██╗████████╗██████╗ ██╗   ██╗██╗ ██████╗
██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔══██╗╚██╗ ██╔╝██║██╔═══██╗
███████╗█████╗  ██╔██╗ ██║   ██║   ██████╔╝ ╚████╔╝ ██║██║   ██║
╚════██║██╔══╝  ██║╚██╗██║   ██║   ██╔══██╗  ╚██╔╝  ██║██║   ██║
███████║███████╗██║ ╚████║   ██║   ██║  ██║   ██║██╗██║╚██████╔╝
╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝╚═╝╚═╝ ╚═════╝'
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

# TODO - will work on all macs/most systems?
function cleanup {
  echo "Stopping system/com.apple.audio.coreaudiod"
  kill 0
}
trap cleanup EXIT

play_song
run


