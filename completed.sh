#!/bin/bash
BASEDIR=$(dirname "$0")
MSG=$1
NOTIFY=$(cat /usr/local/etc/NotifyBuildResult/notify)
START=$(cat /usr/local/etc/NotifyBuildResult/start-time)
END=$(date +%s)
TIME=$(date -r `echo $END - $START | bc` "+%M:%S")

rm /usr/local/etc/NotifyBuildResult/start-time
if [ "$NOTIFY" != "off" ]; then
	$BASEDIR/sendMessage "$MSG" $TIME

	if [ "$NOTIFY" == "once" ]; then
		echo off > /usr/local/etc/NotifyBuildResult/notify
	fi
fi
