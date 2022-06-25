#!/bin/sh 

stats=(cpu memory disk)

storageList=($(getStorage 4))
diskName=($(getStorage 1))

for stat in ${stats[@]};
do
        icon="$(ls ~/Pictures/*.* | shuf | tail -n1)"
        notify-send.sh \
        --icon=$icon \
        --expire-time=45000 \
        "$(neofetch --config ~/.config/neofetch/config2.conf $stat)"
done

