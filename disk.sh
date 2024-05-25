#!/bin/sh


#KB Read
READ=$(iostat -d | awk 'NR==4 {print $3}')

#KB Write
WRITE=$(iostat -d | awk 'NR==4 {print $4}')

READ=$(echo "${READ}" | awk '{ printf "%.2f\n", $1/1024 }')
WRITE=$(echo "${WRITE}" | awk '{ printf "%.2f\n", $1/1024 }')

echo "$(date +"%Y-%m-%dT%H:%M:%S.000Z") ${READ} ${WRITE}"
