#!/bin/sh
INT=`xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep -v ^DP | head -n 1`

xinput | sed -n -e '/pointer/,/keyboard/ p' | grep "\(ELAN Touchscreen\|Wacom HID 490B Finger\|Wacom Pen and multitouch sensor Finger\)" | sed 's/^.*id=\([0-9]*\)[ \t].*$/\1/' | xargs -I \% xinput --map-to-output \% "${INT}"
