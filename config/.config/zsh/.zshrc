#!/usr/bin/env zsh

while read file
do 
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
env
history
key-bindings
theme
plugins
aliases
functions
utility
dircolors
EOF
