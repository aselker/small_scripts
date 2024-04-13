#!/bin/bash

# TODO: Autodetect eDP name

if swaymsg -t get_outputs | grep -q "normal"
then
	swaymsg output eDP-1 transform 180
else
	swaymsg output eDP-1 transform normal
fi

swaymsg input 1386:20896:Wacom_Pen_and_multitouch_sensor_Pen map_to_output eDP-1
swaymsg input 1386:20896:Wacom_Pen_and_multitouch_sensor_Finger map_to_output eDP-1
#swaymsg input 2:10:TPPS/2_Elan_TrackPoint map_to_output eDP-1
#swaymsg input 2:7:SynPS/2_Synaptics_TouchPad map_to_output eDP-1
