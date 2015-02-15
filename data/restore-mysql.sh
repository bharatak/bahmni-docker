#!/bin/sh
set -e -x
dumpfile=$1

if [ -z $dumpfile ]; then
	echo "Please specify sql dump file"
	exit 1
fi

mysql -h dockerhost -P 49000 -uroot -ppassword < $dumpfile
