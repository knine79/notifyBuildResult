#!/bin/bash
WEBHOOK_URL=$(cat $HOME/.NotifyBuildResult/KakaoWork/incoming-webhook-url)

curl -X POST "$WEBHOOK_URL" -H "Content-Type: application/json" -d '{
    "text":"'"$1 - $2"'",
    "blocks": [
        {
            "type": "header",
            "text": "'"$1"'",
            "style": "blue"
        },
        {
            "type": "text",
            "text": "'"it takes 👉 *$2*"'",
            "markdown": true
        }
    ]
}'