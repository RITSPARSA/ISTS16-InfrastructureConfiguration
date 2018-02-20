#!/bin/sh

# get rid of the cursor so we don't see it when videos are running
setterm -cursor off																						

VIDEOPATH="/home/pi/vids" 

# you can normally leave this alone
SERVICE="chromium-browser"
ARGS="--kiosk --incognito"
URL="http://{{ machines[inventory_hostname]['ip'] }}/"

# now for our infinite loop!
while true; do 
	$SERVICE $ARGS $URL
	$SERVICE $ARGS $URL
done
