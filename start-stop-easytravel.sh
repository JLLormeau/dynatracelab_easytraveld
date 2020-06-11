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

case "$1" in
	start)
    		cd /home/dynatracelab_easytraveld
   		docker-compose down
		docker-compose up -d
		;;
	stop)
    		cd /home/dynatracelab_easytraveld
		docker-compose down
		;;
	*)
		echo "Usage: $0 {start|stop}"
		exit 1
		;;
esac
