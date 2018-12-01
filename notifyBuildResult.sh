#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
osascript $SCRIPTPATH/notifyBuildResult.scpt
