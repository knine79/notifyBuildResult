#!/bin/bash
if [ ! -f /usr/local/etc/NotifyBuildResult/notify ]; then
	mkdir -p /usr/local/etc/NotifyBuildResult/
	echo off > /usr/local/etc/NotifyBuildResult/notify
fi
if [ -e $1 ]; then
	if [ ! -f /usr/local/etc/PushBulllet/access-token ]; then
		echo "PushBullet access token needed."
		echo "You can obtain it https://www.pushbullet.com/#settings/account."
	fi
else
	if [ ! -f /usr/local/etc/PushBulllet/access-token ]; then
		mkdir -p /usr/local/etc/PushBulllet/
	fi
	echo $1 > /usr/local/etc/PushBulllet/access-token
fi

