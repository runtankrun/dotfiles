#!/bin/sh 
brr() {
        figlet -f ~/.fonts/misc/figlet/future.tlf $(echo $(temp))
}
temp() {
        cat \
        /sys/class/thermal/thermal_zone*/temp | \
        column -s $'\t' -t | \
        sed 's/\(.\)..$/.\1°C/' | \
        tail -n1
}

icon() {
echo $(find ~/Pictures/*.* | shuf | tail -n1)
}

# normal
notify-send -u critical -t 99999 --icon=$(icon) "$(temp)" 'System Temperature'
notify-send -u normal -t 99999 --icon=$(icon) "$(usedcpu)" 'Used CPU'
notify-send -u low -t 9999 --icon=$(icon) "$(df -h / | tail -n1 | sd '    ' '')"
