#!/bin/bash
configuredThreshold=80.0
cpuUse=$(cat /proc/loadavg | awk '{print $1}')

echo $cpuUse %

if [[ ${cpuUse%%.*} -ge ${configuredThreshold%%.*} ]]
then
	now=$(date)
	echo "$now">>output.txt
	echo "CPU Current Usage is: $cpuUse%"
	echo "+-------------------------------------------------------------+">>output.txt
	echo "+ Top Running Processes                                       +">>output.txt
  echo "+-------------------------------------------------------------+">>output.txt
  echo "$(ps -eo pid,ppid,cmd,%cpu --sort=-%cpu |head -10)">>output.txt
	echo "">>output.txt
else
	echo "CPU Usage doesnot exceeded configured threshold"
fi
