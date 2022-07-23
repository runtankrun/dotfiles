# set PATH so it includes user's private bin if it exists
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export EDITOR=vim
export VISUAL=vim

# enable mousekeys (my xmodmap has mousekeys mapped to buttons)
/usr/bin/xkbset exp =m
/usr/bin/xkbset m

# Make ~/.scripts folder executable
export PATH="${PATH}:$HOME/.scripts"
export PATH="${PATH}:$HOME/.scripts/cli-apps"
export PATH="${PATH}:$HOME/.scripts/colors"
export PATH="${PATH}:$HOME/.scripts/colors/toys"
export PATH="${PATH}:$HOME/.scripts/xfrom_source/nsxiv"
export PATH="${PATH}:$HOME/.scripts/layout"
export PATH="${PATH}:$HOME/.scripts/system_exec"
export PATH="${PATH}:$HOME/.scripts/ranger"
export PATH="${PATH}:$HOME/.scripts/util"
