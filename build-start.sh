#!/bin/bash
if [ ! -f /tmp/notify_build_result ]; then
	echo off > /tmp/notify_build_result
fi
echo $(date +%s) > /tmp/build_start_time
