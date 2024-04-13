#!/usr/bin/env bash

swaymsg output HDMI-A-1 mode 1920x1080@144Hz
#swaymsg output eDP-1 position 0 1080
#swaymsg output HDMI-A-1 position 0 0
swaymsg output eDP-1 disable
