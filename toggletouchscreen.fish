#!/usr/bin/env fish

if xinput list-props "ELAN Touchscreen" | grep -q 'Device Enabled.*:.*1$'
	xinput disable "ELAN Touchscreen"
else if xinput list-props "ELAN Touchscreen" | grep -q 'Device Enabled.*:.*0$'
	xinput enable "ELAN Touchscreen"
end
