#!/bin/bash
set -e

case "$1" in
	"install" )
		echo -e "Setting up for the first time"
		docker-compose up --no-recreate
		;;
	"start" )
		echo -e "Starting the containers"
		docker-compose start
		;;
	"stop" )
		echo -e "Stopping the containers"
		docker-compose stop
		;;
	"clean" )
		docker-compose rm -v
		;;
	* )
		echo -e "Invalid option $1"
		;;
esac