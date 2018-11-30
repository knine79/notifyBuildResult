#!/bin/bash
NOTIFY=$(cat /tmp/notify_build_result)
PUSHBULLET_ACCESS_TOKEN=$(cat access-token)
START=$(cat /tmp/build_start_time)
END=$(date +%s)
TOTAL=$(echo "($END - $START) / 60" | bc)

rm /tmp/build_start_time
if [ "$NOTIFY" != "off" ]; then
	curl --header "Access-Token: $PUSHBULLET_ACCESS_TOKEN" \
		--header 'Content-Type: application/json' \
		--data-binary '{"body":"'"$TOTAL minutes taken"'","title":"Build Failed","type":"note"}' \
		--request POST \
		https://api.pushbullet.com/v2/pushes
fi
