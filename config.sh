#!/bin/bash
if [ ! -f /tmp/NotifyBuildResult/notify ]; then
	mkdir -p /tmp/NotifyBuildResult/
	echo off > /tmp/NotifyBuildResult/notify
fi
if [ -e $1 ]; then
	if [ ! -f /tmp/NotifyBuildResult/access-token ]; then
		echo "PushBullet access token needed."
		echo "You can obtain it https://www.pushbullet.com/#settings/account."
	fi
else
	echo $1 > /tmp/NotifyBuildResult/access-token
fi

