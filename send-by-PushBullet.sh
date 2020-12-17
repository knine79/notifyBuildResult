ACCESS_TOKEN=$(cat /usr/local/etc/PushBulllet/access-token)

curl --header "Access-Token: $ACCESS_TOKEN" \
    --header 'Content-Type: application/json' \
    --data-binary '{"body":"'"$2 minutes taken"'","title":"'"$1"'","type":"note"}' \
    --request POST \
    https://api.pushbullet.com/v2/pushes
