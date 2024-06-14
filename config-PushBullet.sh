#!/bin/bash
if [ ! -f $HOME/.NotifyBuildResult/notify ]; then
	mkdir -p $HOME/.NotifyBuildResult/
	echo off > $HOME/.NotifyBuildResult/notify
fi
if [ -e $1 ]; then
	if [ ! -f $HOME/.NotifyBuildResult/PushBulllet/access-token ]; then
		echo "PushBullet access token needed."
		echo "You can obtain it https://www.pushbullet.com/#settings/account."
	fi
else
	if [ ! -f $HOME/.NotifyBuildResult/PushBulllet/access-token ]; then
		mkdir -p $HOME/.NotifyBuildResult/PushBulllet/
	fi
	echo $1 > $HOME/.NotifyBuildResult/PushBulllet/access-token
fi

ln -sf send-by-PushBullet.sh sendMessage
chmod +x sendMessage