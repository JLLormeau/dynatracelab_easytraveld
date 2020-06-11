#!/bin/bash

source /etc/sysconfig/rc
source $rc_functions
case "$1" in
	start)
		echo "Starting EasyTravel..."
    cd dynatracelab_easytraveld
    sudo docker-compose up -d
		;;
	stop)
		echo "Stopping EasyTravel..."
		docker-compose down
		;;
	restart)
		$0 stop
		sleep 1
		$0 start
		;;
	*)
		echo "Usage: $0 {start|stop|restart}"
		exit 1
		;;
esac
