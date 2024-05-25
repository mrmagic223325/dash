#!/bin/sh

echo "$(date +"%Y-%m-%dT%H:%M:%S.000Z") $(cat /proc/loadavg | awk '{print $1 " " $2 " " $3}')"
