#!/bin/bash
BASEDIR=$(dirname "$0")
OP=$1
MSG=$2
SUCCESS=$3
NOTIFY=$(cat $HOME/.NotifyBuildResult/notify)
START=$(cat $HOME/.NotifyBuildResult/$OP-start-time)
END=$(date +%s)
TIME=$(date -r `echo $END - $START | bc` "+%M:%S")
PRJDIR=$(pwd)

rm $HOME/.NotifyBuildResult/$OP-start-time
if [ "$NOTIFY" != "off" ]; then
	$BASEDIR/sendMessage "$MSG" $TIME $SUCCESS "$PRJDIR"

	if [ "$NOTIFY" == "once" ]; then
		echo off > $HOME/.NotifyBuildResult/notify
	fi
fi
