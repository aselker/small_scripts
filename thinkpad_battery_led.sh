#!/usr/bin/env bash
if [ $(acpi -b | head -n 1 | grep -P -o '[0-9]+(?=%)') \> 10 ] || [ $(acpi -b | tail -n 1 | grep -P -o '[0-9]+(?=%)') \> 10 ]; then
	b=0
else
	b=1
fi

echo $b > /sys/class/leds/tpacpi::power/brightness
