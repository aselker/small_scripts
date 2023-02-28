#!/usr/bin/env bash

ddcutil setvcp 10 $1 -d 1
ddcutil setvcp 10 $(echo "$1 * 1.7" | bc | awk '{printf("%d\n",$1 + 0.5)}') -d 2
#ddcutil setvcp 10 $1 -d 3
