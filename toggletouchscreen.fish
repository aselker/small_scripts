#!/usr/bin/env fish

if xinput | grep -q "Xwayland"
	if xinput list-props "ELAN Touchscreen" | grep -q 'Device Enabled.*:.*1$'
		xinput disable "ELAN Touchscreen"
	else if xinput list-props "ELAN Touchscreen" | grep -q 'Device Enabled.*:.*0$'
		xinput enable "ELAN Touchscreen"
	end

	if xinput list-props "Wacom HID 490B Finger" | grep -q 'Device Enabled.*:.*1$'
		xinput disable "Wacom HID 490B Finger"
	else if xinput list-props "Wacom HID 490B Finger" | grep -q 'Device Enabled.*:.*0$'
		xinput enable "Wacom HID 490B Finger"
	end

	if xinput list-props "Wacom Pen and multitouch sensor Finger" | grep -q 'Device Enabled.*:.*1$'
		xinput disable "Wacom Pen and multitouch sensor Finger"
	else if xinput list-props "Wacom Pen and multitouch sensor Finger" | grep -q 'Device Enabled.*:.*0$'
		xinput enable "Wacom Pen and multitouch sensor Finger"
	end

	reposition-touchscreen.sh
else
	swaymsg input type:touch events toggle
	swaymsg input type:touch map_to_output eDP-1
end

