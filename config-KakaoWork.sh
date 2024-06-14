#!/bin/bash
if [ ! -f $HOME/.NotifyBuildResult/notify ]; then
	mkdir -p $HOME/.NotifyBuildResult/
	echo off > $HOME/.NotifyBuildResult/notify
fi
if [ -e $1 ]; then
	if [ ! -f $HOME/.NotifyBuildResult/KakaoWork/incoming-webhook-url ]; then
		echo "KakaoWork Incoming Webhook URL needed."
	fi
else
	if [ ! -f $HOME/.NotifyBuildResult/KakaoWork/incoming-webhook-url ]; then
		mkdir -p $HOME/.NotifyBuildResult/KakaoWork/
	fi
	echo $1 > $HOME/.NotifyBuildResult/KakaoWork/incoming-webhook-url
fi

ln -sf send-by-KakaoWork.sh sendMessage
chmod +x sendMessage
