#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/quicklinks.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Browser
if [[ -f /usr/lib/firefox/firefox-bin ]]; then
	app="/usr/lib/firefox/firefox-bin"
elif [[ -f /usr/bin/chromium ]]; then
	app="chromium"
elif [[ -f /usr/bin/midori ]]; then
	app="midori"
else
	msg "No suitable web browser found!"
	exit 1
fi

# Links
duckduckgo=""
reddit=""
snahp=""
github=""
mail=""
youtube=""

# Variable passed to rofi
options="$google\n$facebook\n$twitter\n$github\n$mail\n$youtube"

chosen="$(echo -e "$options" | $rofi_command -p "Open In  :  $app" -dmenu -selected-row 0)"
case $chosen in
    $duckduckgo)
        $app https://www.duckduckgo.com &
        ;;
    $reddit)
        $app https://www.reddit.com &
        ;;
    $snahp)
        $app https://fora.snahp.eu/ &
        ;;
    $github)
        $app https://www.github.com &
        ;;
    $mail)
        $app https://www.protonmail.com https://account.protonvpn.com/login &
        ;;
    $youtube)
        $app https://www.youtube.com &
        ;;
esac

