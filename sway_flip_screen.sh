#!/bin/bash

output_name=$(swaymsg -t get_outputs | jq -r '.[]|.name')

if swaymsg -t get_outputs | grep -q "normal"
then
	swaymsg output $output_name transform 180
else
	swaymsg output $output_name transform normal
fi

swaymsg input 1386:20896:Wacom_Pen_and_multitouch_sensor_Pen map_to_output $output_name
swaymsg input 1386:20896:Wacom_Pen_and_multitouch_sensor_Finger map_to_output $output_name
