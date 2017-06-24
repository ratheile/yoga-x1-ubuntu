#!/bin/bash
# Where the backlight brightness is stored
BR_DIR="/sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/intel_backlight/"

test -d "$BR_DIR" || exit 0

MIN=0
MAX=$(cat "$BR_DIR/max_brightness")
VAL=$(cat "$BR_DIR/brightness")

if [ "$1" = down ]; then
    VAL=$((VAL-71))
else
    VAL=$((VAL+71))
fi

if [ "$VAL" -lt $MIN ]; then
    VAL=$MIN
elif [ "$VAL" -gt $MAX ]; then
    VAL=$MAX
fi

PERCENT=`echo "$VAL / $MAX" | bc -l`

# export XAUTHORITY=/home/ivo/.Xauthority  # CHANGE "ivo" TO YOUR USER
# export DISPLAY=:0.0

export XAUTHORITY=/run/user/1000/gdm/Xauthority
export DISPLAY=:1

xrandr --output eDP-1 --brightness $PERCENT # >> /tmp/yoga-brightness.log
echo "1: xrandr --output eDP-1 --brightness $PERCENT" # >> /tmp/yoga-brightness.log
echo $VAL > "$BR_DIR/brightness"
