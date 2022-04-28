#!/bin/sh 

stats=(cpu memory disk)

for stat in ${stats[@]};
do
        icon="$(ls ~/Pictures/*.* | shuf | tail -n1)"
        notify-send \
        --icon=$icon \
        --expire-time=45000 \
        "$(neofetch --config ~/.config/neofetch/config2.conf $stat)"
done
