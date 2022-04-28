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

echo "#step 1 #Large MemoryDump"

cd /home/dynatracelab_easytraveld
$DOKER_DIR/docker-compose down
$DOKER_DIR/docker-compose -f docker-compose-issue.yml up -d &

echo "next step in 15 min"

sleep 900 # 15 minutes

echo "#step 2  #Restart Easytravel"

cd /home/dynatracelab_easytraveld
$DOKER_DIR/docker-compose down
$DOKER_DIR/docker-compose up -d &

echo "next step in 1h30"

sleep 5400 #1h30

echo "#step 3 #shutdown mongodb"
cd /home/dynatracelab_easytraveld
$DOKER_DIR/docker-compose stop loadgen mongodb
$DOKER_DIR/docker-compose start mongodb loadgen &

echo "next step in 15 min"
sleep 900 #15min

echo "#step 4  #Restart Easytravel"

cd /home/dynatracelab_easytraveld
$DOKER_DIR/docker-compose down
$DOKER_DIR/docker-compose up -d &

