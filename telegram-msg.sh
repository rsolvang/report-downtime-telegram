#!/bin/bash

set -o allexport; source .env; set +o allexport

while getopts ":hm:" option; do
		case "${option}" in
		h ) 
			echo ""
			echo 'A simple script to test if your connection to the Telegram bot works.'
			echo ""
			echo 'Usage: Run the script with no arguments to send "Hello World!" to your bot.'
			echo 'Use the -m argument to send a custom message, e.g. -m Single-string or -m "A full sentence"'
			echo ""
			exit 0
			;;
		m ) 
			MESSAGE=$OPTARG
			;;
		\? )
			echo "Invalid option: -$OPTARG" 1>&2
			exit 1
			;;
	esac
done


curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MESSAGE" > /dev/null
