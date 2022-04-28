#!/usr/bin/env bash
#//////////////////////////////////////////////////////////////
#//   ____                                                   //
#//  | __ )  ___ _ __  ___ _   _ _ __   ___ _ __ _ __   ___  //
#//  |  _ \ / _ \ '_ \/ __| | | | '_ \ / _ \ '__| '_ \ / __| //
#//  | |_) |  __/ | | \__ \ |_| | |_) |  __/ |  | |_) | (__  //
#//  |____/ \___|_| |_|___/\__,_| .__/ \___|_|  | .__/ \___| //
#//                             |_|             |_|          //
#//////////////////////////////////////////////////////////////
#//                                                          //
#//  Script, 2021                                            //
#//  Created: 31, July, 2021                                 //
#//  Modified: 28, September, 2021                           //
#//  file: https://gist.github.com/jhamfler/cb21414d70696ba4a8957db80f186374                                                 //
#//  -                                                       //
#//  Source: -                                               //
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////

if (($# == 1)); then
    git_url=$(git config --get remote.origin.url | sd '.*@' '')
    # -2560x1440 # If not --fullscreen # --date-format "%Y-%m-%d" --elasticity 0.1 --max-user-speed 500
    # FFMPEG -pix_fmt yuv420p
    gource -1920x1080 --background-image /home/ellio/Pictures/wal/catppuccin/solids/scaled.png --font-file /mnt/PSSD_Storage/corp/c063002t.ttf --font-size 50 --multi-sampling --output-framerate 60 --seconds-per-day 0.1 \
        --filename-time 2 --max-files 0 --bloom-multiplier 0.8 --highlight-users --file-extension-fallback --path . \
        --auto-skip-seconds 0.9 --background-colour 000000 --key --stop-at-end --title "$git_url" --output-ppm-stream - | ffmpeg -y -r 30 \
        -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast \
        -crf 12 -bf 0 -minrate:v 5M -maxrate:v 300M -bufsize:v 800M "$1"
else
    echo "Usage: ${0##*/} <ouput file>"
    exit 1
fi
