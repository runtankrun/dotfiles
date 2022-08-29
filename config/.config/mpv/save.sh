#!/usr/bin/env sh
vid="$(ls -trd $HOME/Videos/h/* | tail -n1)"

echo "v:$vid" >> $HOME/.config/ranger/tagged
