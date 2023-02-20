#!/bin/sh
# extend non-HiDPI external display on DP* above HiDPI internal display eDP*
# see also https://wiki.archlinux.org/index.php/HiDPI
# you may run into https://bugs.freedesktop.org/show_bug.cgi?id=39949
#                  https://bugs.launchpad.net/ubuntu/+source/xorg-server/+bug/883319

#xrandr --auto
# TODO: Run 'xrandr --auto' if no other monitors are connected

# 1080p monitor, 1080p smaller monitor, laptop screen
# 3840 * 3/4 = 2880
# 2160 * 5/8 = 1350
#xrandr --output DP-2 --mode 1920x1080 --rate 120 --scale 1.5x1.5 --pos 0x1350 --output eDP-1 --pos 2880x2160 --output DP-3 --mode 1920x1080 --scale 2x2 --pos 2880x0

# Big 4k monitor, medium-size 1080p, laptop monitor
# 2160 * 1/4 = 540
xrandr --output DP-3 --mode 1920x1080 --scale 1.5x1.5 --pos 0x540 --output DP-1 --mode 3840x2160 --pos 2880x0 --scale 0.9999x0.9999 --output eDP-1 --mode 3840x2160 --pos 2880x2160 --scale 0.9999x0.9999

# TODO: Change compton settings

# Set touchscreen to control only the laptop screen
#INT=`xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep -v ^DP | head -n 1`
#xinput | sed -n -e '/pointer/,/keyboard/ p' | grep "ELAN Touchscreen" | sed 's/^.*id=\([0-9]*\)[ \t].*$/\1/' | xargs -L 1 -I \% xinput --map-to-output \% "${INT}"
reposition-touchscreen.sh
