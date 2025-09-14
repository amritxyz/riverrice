#!/bin/sh

TOUCHPAD_ID=$(riverctl list-inputs | grep Touchpad | awk '{print $1}')
# riverctl input "$TOUCHPAD_ID" accel-profile adaptive
# riverctl input "$TOUCHPAD_ID" pointer-accel 0.3

if [ "$1" = "enable" ]; then
	riverctl input "$TOUCHPAD_ID" tap enabled
elif [ "$1" = "disable" ]; then
	riverctl input "$TOUCHPAD_ID" tap disabled
else
	echo "Usage: $0 <enable|disable>"
	exit 1
fi
