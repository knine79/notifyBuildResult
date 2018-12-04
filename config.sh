#!/bin/bash
if [ ! -f /opt/NotifyBuildResult/notify ]; then
	mkdir -p /opt/NotifyBuildResult/
	echo off > /opt/NotifyBuildResult/notify
fi
if [ -e $1 ]; then
	if [ ! -f /opt/PushBullet/access-token ]; then
		echo "PushBullet access token needed."
		echo "You can obtain it https://www.pushbullet.com/#settings/account."
	fi
else
	echo $1 > /opt/PushBullet/access-token
fi

