#!/bin/bash
NOTIFY=$(cat /opt/NotifyBuildResult/notify)
PUSHBULLET_ACCESS_TOKEN=$(cat /opt/PushBullet/access-token)
START=$(cat /opt/NotifyBuildResult/start-time)
END=$(date +%s)
TOTAL=$(echo "($END - $START) / 60" | bc)

rm /opt/NotifyBuildResult/start-time
if [ "$NOTIFY" != "off" ]; then
	curl --header "Access-Token: $PUSHBULLET_ACCESS_TOKEN" \
    --header 'Content-Type: application/json' \
    --data-binary '{"body":"'"$TOTAL minutes taken"'","title":"Build Succeeded","type":"note"}' \
    --request POST \
    https://api.pushbullet.com/v2/pushes

	if [ "$NOTIFY" == "once" ]; then
		echo off > /opt/NotifyBuildResult/notify
	fi
fi
