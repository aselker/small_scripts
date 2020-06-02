#!/bin/sh
# extend non-HiDPI external display on DP* above HiDPI internal display eDP*
# see also https://wiki.archlinux.org/index.php/HiDPI
# you may run into https://bugs.freedesktop.org/show_bug.cgi?id=39949
#                  https://bugs.launchpad.net/ubuntu/+source/xorg-server/+bug/883319


INT=`xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep -v ^DP | head -n 1`

xrandr --auto

# Set touchscreen to control only the laptop screen
xinput | sed -n -e '/pointer/,/keyboard/ p' | grep "ELAN Touchscreen" | sed 's/^.*id=\([0-9]*\)[ \t].*$/\1/' | xargs -L 1 -I \% xinput --map-to-output \% "${INT}"
