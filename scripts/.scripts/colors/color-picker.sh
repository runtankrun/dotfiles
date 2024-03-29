#!/usr/bin/env bash
VERSION="0o0o0"
TEMP_DIR=/tmp/picked
MSG=${XDG_CACHE_HOME:-$HOME/.cache}/colors.msg

COLOR_TYPE="hex"
WRITE_COLOR_CODE=true
PREVIEW=true
IMAGE_VIEWER="feh"
STDOUT=false

NOTIFICATION=true
EXPIRE_TIME=10000

show_help() {
    cat <<EOF
usage: farge [OPTIONS...]
┌─┐┌─┐┬─┐┌─┐┌─┐
├┤ ├─┤├┬┘│ ┬├┤
┴  ┴ ┴┴└─└─┘└─┘
Click on a pixel on your screen and show its color value
optional arguments:
   --help (-h)           show this help message and exit
   --version (-v)        show the version of farge you are using
   --no-preview          dont show the selected color in a preview window
   --no-color-code       dont write the color code on the preview window
   --rgb                 show the color code as RGB instead of HEX
   --image-viewer        image viewer to use to show the preview (feh, mpv, nsxiv, sxiv)
   --notify              send the color code as notification, where the icon is the selected color
   --expire-time         amount of time the notification should be visible, in milliseconds
   --stdout              output the color value to stdout
EOF
}


hex_to_rgb() {
    # Convert a hex value WITHOUT the hashtag (#)
    R=$(printf "%d" 0x"${1:0:2}")
    G=$(printf "%d" 0x"${1:2:2}")
    B=$(printf "%d" 0x"${1:4:2}")
}


check_dependencies() {
    # Only check xcolor if it's running in X, else check for slurp and grim
    if [ "$WAYLAND_DISPLAY" ]; then
        ! command -v grim &>/dev/null &&
            echo "grim need to be installed: https://wayland.emersion.fr/grim" && v=" "
        ! command -v slurp &>/dev/null &&
            echo "slurp needs to be installed: https://wayland.emersion.fr/slurp" && v=" "
        ! command -v wl-copy &>/dev/null &&
            echo "wl-copy needs to be installed: https://github.com/bugaevc/wl-clipboard" && v=" "
        [ "$v" ] && exit 1
        unset v
    else
        ! command -v xcolor &>/dev/null &&
            echo "xcolor needs to be installed" && exit 1
    fi

    ! command -v convert &>/dev/null &&
        echo "imagemagick needs to be installed" && exit 1

    # We are using the variable $IMAGE_VIEWER because we also have to check if
    # the image viewer the user has told us to use actually exists.

    # If the user wants to show the color and the color code through a notification,
    # then do not check if they have the image viewer installed because it wont be used
    [ $NOTIFICATION == false ] &&
        ! command -v $IMAGE_VIEWER &>/dev/null &&
        echo "$IMAGE_VIEWER needs to be installed or use another image by using --image-viewer <name>" &&
        exit 1
}


# Caclulate math equations with decimals. This is better than $(())
calc(){ awk "BEGIN { print $*}"; }


calculate_text_color(){
    # I dont even know why this equation works
    # Source: https://stackoverflow.com/a/3943023
    INTENSITY=$(calc "$R*0.299 + $G*0.587 + $B*0.114")

    if [ "$(echo "$INTENSITY>186" | bc)" -eq 1 ]; then
        TEXT_COLOR="#000000"
    else
        TEXT_COLOR="#FFFFFF"
    fi
}


image_preview(){
    case $IMAGE_VIEWER in
        "mpv")
            mpv --geometry=100x100 --title="Farge" "$FNAME" &>/dev/null &
            ;;
        "feh")
            feh --geometry=100x100 --title="Farge" "$FNAME" &>/dev/null &
            ;;
        "nsxiv")
            nsxiv -g=100x100 -b -N "Farge" "$FNAME" &>/dev/null &
            ;;
        "sxiv")
            sxiv -g=100x100 -b -N "Farge" "$FNAME" &>/dev/null &
            ;;
        "imv")
            imv "$FNAME" -s shrink &>/dev/null &
            ;;
        *)
            # If the image viewer given by the user is not supported by
            # farge, then let the user know
            echo "The image viewer $IMAGE_VIEWER is not supported yet."
            echo "Make an issue requesting your image viewer: https://github.com/sdushantha/farge/issues/new"
            ;;
    esac
}


main() {
    if [ "$WAYLAND_DISPLAY" ]; then
        HEX_COLOR=$(grim -g "$(slurp -p)" -t ppm - |
            convert - -format '%[pixel:p{0,0}]' txt:- | tail -n1 |
            grep '#' | awk '{print $3}')
    else
        HEX_COLOR=$(xcolor --format hex)
    fi

    # If no color is chosen, then exit
    [[ ! $HEX_COLOR ]] && echo "No color was selected" && exit 1

    mkdir -p $TEMP_DIR

    # Remove the hashtag
    HEX="${HEX_COLOR#\#}"

    # Combine the dir and hex color code to form the file name
    FNAME="$TEMP_DIR/$HEX.png"

    hex_to_rgb "$HEX"

    # If the baground is dark, then use white as the text color.
    # If the background is light, then use a dark text color.
    calculate_text_color

    # Create a 100x100 image, filled with the selected color
    convert -size 100x100 xc:"$HEX_COLOR" "$FNAME"

    if [ $COLOR_TYPE == "rgb" ]; then
        COLOR_CODE="($R,$G,$B)"
    else
        COLOR_CODE="$HEX_COLOR"
    fi


    if [ $WRITE_COLOR_CODE == true ]; then
        # Write the color code in the center of the image
        convert "$FNAME" -gravity Center -pointsize 10 -fill "$TEXT_COLOR" -annotate 0 "$COLOR_CODE" -font "Comfortaa" "$FNAME"
    fi

    # Save the color code to clipboard
    if [ "$WAYLAND_DISPLAY" ]; then
        printf %s "$COLOR_CODE" | wl-copy
    else
        printf %s "$COLOR_CODE" | xclip -sel c
    fi

    # Output the color code to stdout only if the user uses the --stdout flag
    if [ "$STDOUT" == true ]; then
        echo "$COLOR_CODE"
    elif [ "$NOTIFICATION" == "true" ]; then
        notify-send -a Farge "$COLOR_CODE" --icon="$FNAME" --expire-time="$EXPIRE_TIME"
    elif [ "$PREVIEW" == "true" ]; then
        image_preview
    fi
}


while [[ "$1" ]]; do
    case "$1" in
        -h|--help) show_help && exit ;;
        -v|--version) echo $VERSION && exit ;;
        --no-preview) PREVIEW=false ;;
        --no-color-code) WRITE_COLOR_CODE=false ;;
        --rgb) COLOR_TYPE="rgb" ;;
        --image-viewer) IMAGE_VIEWER="$2" ;;
        --notify) NOTIFICATION=true ;;
        --expire-time) EXPIRE_TIME="$2" ;;
        --stdout) STDOUT=true ;;
    esac
    shift
done

# If the user wants to show a notification, then the color code
# will not be written onto the image because the color code will be
# shown in the notification message
[ "$NOTIFICATION" == true ] && WRITE_COLOR_CODE=false

check_dependencies

# When the user runs farge for the first time, tell them how to exit feh.
# We do with by checking if $MSG exists
[ ! -f "$MSG" ] && echo "To close the color window, click on it and press 'q'" && touch "$MSG"

# Run the main function where all the magic happens
main
