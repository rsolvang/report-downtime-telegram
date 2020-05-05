#!/usr/bin/env bash

# Import variables from the .env file
set -o allexport; source .env; set +o allexport

function check()
{
	status=`wget --spider -S "$site" 2>&1 | awk '/HTTP\// {print $2}'`
	if [ "$status" == "200" ]; then
		return 0
	else
		return 1
	fi
}

function check_and_report()
{
	date=`date --iso-8601=seconds`
	if check "$1"; then
		result=OK
	else
		result=FAIL
	fi
	if [ "$log_failures_only" -eq "1" ]; then
		if [ "$result" == "FAIL" ]; then
			echo "$date $1 $result" >> $sitelog
			curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$1 is not responding!" -d disable_web_page_preview=1 > /dev/null
		fi
	else
		echo "$date $1 $result" >> $sitelog
	fi
}

if [ -e "$sitefile" ]; then
	while read site; do
		check_and_report "$site"
	done < "$sitefile"
else
	echo "Sites file does not exist"
	exit 1
fi
