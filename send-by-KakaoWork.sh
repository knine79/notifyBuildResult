WEBHOOK_URL=$(cat /usr/local/etc/KakaoWork/incoming-webhook-url)

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
            "text": "'"작업 소요 시간 👉 *$2*"'",
            "markdown": true
        }
    ]
}'