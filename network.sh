#!/bin/sh


UP="$(ifstat -b -i enp1s0 0.1 1 | awk 'NR==3{print $1}')"
DOWN="$(ifstat -b -i enp1s0 0.1 1 | awk 'NR==3{print $2}')"

printf "%s %.2f %.2f\n" "$(date +"%Y-%m-%dT%H:%M:%S.000Z")" "${UP}" "${DOWN}"
