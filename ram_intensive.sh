#!/bin/sh

RAM="$(top -o %MEM -b -n 1 | head -n 10 | tail -n 3 | tail -n 3)"

FIRST="$(echo "${RAM}" | awk 'NR==1{print $10 " " $12}')"
SECOND="$(echo "${RAM}" | awk 'NR==2{print $10 " " $12}')"
THIRD="$(echo "${RAM}" | awk 'NR==3{print $10 " " $12}')"

echo "$(date +"%Y-%m-%dT%H:%M:%S.000Z") ${FIRST} ${SECOND} ${THIRD}"
