#!/bin/bash
### BEGIN INIT INFO
# Provides: skeleton
# Required-Start: $remote_fs $syslog
# Required-Stop: $remote_fs $syslog
# Should-Start: $portmap
# Should-Stop: $portmap
# X-Start-Before: nis
# X-Stop-After: nis
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# X-Interactive: true
# Short-Description: Example initscript
# Description: This file should be used to construct scripts to be placed in /etc/init.d.
#
### END INIT INFO

#export DOKER_DIR=/usr/local/bin
export DOKER_DIR=/usr/bin

case "$1" in
	start)
    		cd /home/dynatracelab_easytraveld
   		$DOKER_DIR/docker-compose down
		$DOKER_DIR/docker-compose up -d
		;;
	stop)
    		cd /home/dynatracelab_easytraveld
		$DOKER_DIR/docker-compose down
		;;
	restart)
    		cd /home/dynatracelab_easytraveld
		$DOKER_DIR/docker-compose down
		$DOKER_DIR/docker-compose up -d
		;;
	status)
    		cd /home/dynatracelab_easytraveld
		$DOKER_DIR/docker-compose ps
		;;
	startloadgen)
    		cd /home/dynatracelab_easytraveld
		$DOKER_DIR/docker-compose start loadgen 
		;;
	stoploadgen)
    		cd /home/dynatracelab_easytraveld
		$DOKER_DIR/docker-compose stop loadgen
		;;
	restartmongo)
    		cd /home/dynatracelab_easytraveld
		$DOKER_DIR/docker-compose stop loadgen mongodb
		$DOKER_DIR/docker-compose start mongodb loadgen 
		;;	
	stopmongo)
    		cd /home/dynatracelab_easytraveld
		$DOKER_DIR/docker-compose stop mongodb
		;;
        issue)
                cd /home/dynatracelab_easytraveld
                $DOKER_DIR/docker-compose down
                $DOKER_DIR/docker-compose -f docker-compose-issue.yml up -d
                ;;
	*)
		echo "Usage: $0 {start|stop|restart|startloadgen|stoploadgen|restartmongo|stopmongo|status}"
		exit 1
		;;
esac
