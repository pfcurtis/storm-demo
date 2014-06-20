#!/bin/bash

COLOR=$1

if [ -z ${COLOR} ]
	then
	echo "you must specify a color!"
	exit 1
fi
	
BIN_DIR="$( cd "$( dirname "$0" )" && pwd )"
. $BIN_DIR/env.sh

exec 2>&1


if [ ${COLOR} = "red" ]
	then 
	echo "you chose red"
	cp -f ${WWW_DIR}/css/red/* ${WWW_DIR}/css/
	echo "all done, hit refresh in your browser"
elif [ ${COLOR} = "white" ]
	then
	echo "you chose white"
	cp -f ${WWW_DIR}/css/white/* ${WWW_DIR}/css/
	echo "all done, hit refresh in your browser"
else
	echo "you can only choose red or white..try again"
	exit 1
fi

