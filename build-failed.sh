#!/bin/bash
NOTIFY=$(cat /tmp/NotifyBuildResult/notify)
PUSHBULLET_ACCESS_TOKEN=$(cat /tmp/NotifyBuildResult/access-token)
START=$(cat /tmp/NotifyBuildResult/start-time)
END=$(date +%s)
TOTAL=$(echo "($END - $START) / 60" | bc)

rm /tmp/NotifyBuildResult/start-time
if [ "$NOTIFY" != "off" ]; then
	curl --header "Access-Token: $PUSHBULLET_ACCESS_TOKEN" \
		--header 'Content-Type: application/json' \
		--data-binary '{"body":"'"$TOTAL minutes taken"'","title":"Build Failed","type":"note"}' \
		--request POST \
		https://api.pushbullet.com/v2/pushes
fi
