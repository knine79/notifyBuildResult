#!/bin/bash
if [ ! -f /usr/local/etc/NotifyBuildResult/notify ]; then
	mkdir -p /usr/local/etc/NotifyBuildResult/
	echo off > /usr/local/etc/NotifyBuildResult/notify
fi
if [ -e $1 ]; then
	if [ ! -f /usr/local/etc/KakaoWork/incoming-webhook-url ]; then
		echo "KakaoWork Incoming Webhook URL needed."
	fi
else
	if [ ! -f /usr/local/etc/KakaoWork/incoming-webhook-url ]; then
		mkdir -p /usr/local/etc/KakaoWork/
	fi
	echo $1 > /usr/local/etc/KakaoWork/incoming-webhook-url
fi

ln -sf send-by-KakaoWork.sh sendMessage
chmod +x sendMessage