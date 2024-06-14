#!/bin/bash
if [ ! -f $HOME/.NotifyBuildResult/notify ]; then
	mkdir -p $HOME/.NotifyBuildResult/
	echo off > $HOME/.NotifyBuildResult/notify
fi
if [ -e $1 ]; then
	if [ ! -f $HOME/.NotifyBuildResult/Slack/incoming-webhook-url ]; then
		echo "Slack Incoming Webhook URL needed."
	fi
else
	if [ ! -f $HOME/.NotifyBuildResult/Slack/incoming-webhook-url ]; then
		mkdir -p $HOME/.NotifyBuildResult/Slack/
	fi
	echo $1 > $HOME/.NotifyBuildResult/Slack/incoming-webhook-url
fi

ln -sf send-by-Slack.sh sendMessage
chmod +x sendMessage
