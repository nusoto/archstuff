#!/bin/sh

if [ -z "$1" ]
then
	vared -p 'Screen Brightness value: ' -c brightness
elif echo "$1" | grep -qE '^[0-9]+$'
then
	brightness=$1
else
	exit 0
fi


if [ $brightness -gt 4000 ]
then
	brightness=4000;
elif [ $brightness -lt 100 ]
then
	brightness=100;
fi

if [ $brightness -le 4000 ] && [ $brightness -ge 100 ]
then
	echo $brightness | sudo tee /sys/class/backlight/intel_backlight/brightness
fi
