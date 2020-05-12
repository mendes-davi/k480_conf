#!/bin/sh
# Inspiration from: https://github.com/jergusg/k380-function-keys-conf/blob/master/fn_on.sh

IN="$(printf "on\\noff" | dmenu -i -p FN-KEYS -nb darkblue -sb blue -sf white -nf gray)"
TOOL="./k480_conf"
# Check if device is your keyboard: 046D:B33D (if not, possibly B330 or B33C)
DEV="$(ls /sys/class/hidraw/ -l | grep 046D:B33D | grep -o 'hidraw[0-9]*$')"

if test -n "$DEV" && (test -z "$1" || test "/dev/$DEV" = "$1")
then
    sudo $TOOL -d "/dev/$DEV" -f $IN
else
    notify-send "FN-Keys Errror: K480 not found!"
fi
