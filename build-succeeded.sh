#!/bin/bash
NOTIFY=$(cat /usr/local/etc/NotifyBuildResult/notify)
PUSHBULLET_ACCESS_TOKEN=$(cat /usr/local/etc/PushBulllet/access-token)
START=$(cat /usr/local/etc/NotifyBuildResult/start-time)
END=$(date +%s)
TOTAL=$(echo "($END - $START) / 60" | bc)

rm /usr/local/etc/NotifyBuildResult/start-time
if [ "$NOTIFY" != "off" ]; then
	curl --header "Access-Token: $PUSHBULLET_ACCESS_TOKEN" \
    --header 'Content-Type: application/json' \
    --data-binary '{"body":"'"$TOTAL minutes taken"'","title":"Build Succeeded","type":"note"}' \
    --request POST \
    https://api.pushbullet.com/v2/pushes

	if [ "$NOTIFY" == "once" ]; then
		echo off > /usr/local/etc/NotifyBuildResult/notify
	fi
fi
