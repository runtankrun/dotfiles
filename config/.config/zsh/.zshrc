## ░▀▀█░█▀▀░█░█░█▀▄░█▀▀
## ░▄▀░░▀▀█░█▀█░█▀▄░█░░
## ░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀
##
## rxyhn's Z-Shell configuration
## https://github.com/rxyhn

while read file
do 
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
theme
env
aliases
utility
functions
options
plugins
keybinds
prompt
EOF

# vim:ft=zsh:nowrap
