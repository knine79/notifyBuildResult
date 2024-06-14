#!/bin/bash
WEBHOOK_URL=$(cat $HOME/.NotifyBuildResult/Slack/incoming-webhook-url)

MSG=$1
TIME=$2
if [ $3 == 0 ]; then
    COLOR="danger"
else
    COLOR="good"
fi
PRJDIR=$4

curl -X POST "$WEBHOOK_URL" --data-urlencode 'payload={
        "attachments":[
            {
                "fallback":"'"$MSG - $TIME"'",
                "color":"'"$COLOR"'",
                "fields":[
                    {
                    "title":"'"$MSG"'",
                    "value":"⏱️'"$TIME\nProject Directory: $PRJDIR"'",
                    "short":false
                    }
                ]
            }
        ]
    }'
