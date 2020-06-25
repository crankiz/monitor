#!/usr/bin/env bash
# This script needs notify-cli
# npm install -g notify-cli

host="hostname"
date=$(date "+%Y-%m-%d %H:%M:%S")
logpath="$(dirname "$0")/monitor.log"
[ -f ${logpath} ] || touch "${logpath}"

ping_func(){
  ping -i 0.33 -c 3 ${host} &> /dev/null
}

send_push () {
  notify -i "$1" -t "$2"
}

main () {
  prev_state=$(awk 'END{print $4}' "${logpath}")
  ping_func && new_state="online" || new_state="offline"
  logpost=$(printf "%s %s %s\n" "${date}" "${host}" "${new_state}")
  [ "${new_state}" != "${prev_state}" ] && send_push "${host} ${new_state}!" "${logpost}"|| exit 0
  printf "%s" "${logpost}" >> ${logpath}
}

main