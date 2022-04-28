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

#step 1 #Large MemoryDump

cd /home/dynatracelab_easytraveld
/usr/local/bin/docker-compose down
/usr/local/bin/docker-compose -f docker-compose-issue.yml up -d &

sleep 900 # 15 minutes

#step 2  #Restart Easytravel

cd /home/dynatracelab_easytraveld
/usr/local/bin/docker-compose down
/usr/local/bin/docker-compose up -d &

sleep 5400 #1h30

#step 3 #shutdown mongodb
cd /home/dynatracelab_easytraveld
/usr/local/bin/docker-compose stop loadgen mongodb
/usr/local/bin/docker-compose start mongodb loadgen &

sleep 900 #15min

#step 4  #Restart Easytravel

cd /home/dynatracelab_easytraveld
/usr/local/bin/docker-compose down
/usr/local/bin/docker-compose up -d &

