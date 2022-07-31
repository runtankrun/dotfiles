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

theme="style_1"
dir="$HOME/.config/rofi/launchers/colorful"

# dark
ALPHA="#1a1b2600"
BG="#1a1b26ff"
FG="#c0caf5ff"
SELECT="#282c34ff"

# light
#ALPHA="#282c3400"
#BG="#FFFFFFff"
#FG="#282c34ff"
#SELECT="#f3f3f3ff"

# accent colors
COLORS=('#282c34' '#f7768e' '#73daca' '#e0af68' '#7aa2f7' '#bb9af7' '#7dcfff' '#c0caf5' \
        '#414868' '#f7768e' '#73daca' '#73daca' '#e0af68' '#e0af68' '#7aa2f7' '#7aa2f7')
ACCENT="${COLORS[$(( $RANDOM % 14 ))]}ff"

# overwrite colors file
cat > $dir/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF

# comment these lines to disable random style
themes=($(ls -p --hide="launcher.sh" --hide="colors.rasi" $dir))
theme="${themes[$(( $RANDOM % 6 ))]}"

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
