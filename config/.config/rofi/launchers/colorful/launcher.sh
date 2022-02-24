#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# style_1     style_2     style_3     style_4     style_5     style_6
# style_7     style_8     style_9     style_10    style_11    style_12

theme="style_2"
dir="$HOME/.config/rofi/launchers/colorful"

pycolors () {
source ~/.cache/wal/colors.sh
ALPHA=#00000000
BG=$background
SELECT=$color0
FG=$foreground
ACCENT=$color4

cat > $dir/colors.rasi <<- EOF
	/* colors */
	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
      red: #EC7875ff;
      green: #61C766ff;
      yellow: #FDD835ff;
      blue: #42A5F5ff;
      purple: #BA68C8ff;
      cyan: #4DD0E1ff;
	}
EOF
}

## comment these lines to disable random style
#themes=($(ls -p --hide="launcher.sh" --hide="colors.rasi" $dir))
#theme="${themes[$(( $RANDOM % 12 ))]}"
pycolors
rofi -no-lazy-grab -show drun -theme $dir/"$theme"
