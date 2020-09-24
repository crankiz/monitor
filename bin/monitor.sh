#!/bin/sh
# This script needs notify-cli
# npm install -g notify-cli
CURRENT_STATE='NULL'
date=$(date "+%Y-%m-%d %H:%M:%S")

if [ ! -f ~/.notifyreg ]; then
  notify -r $TOKEN
fi

ping_func(){
  ping -c 3 $MONITOR_HOST > /dev/null
}

send_push () {
  notify -i "$1" -t "$2"
}

main () {
  ping_func && NEW_STATE="ONLINE" || NEW_STATE="OFFLINE"
  log=$(printf "%s %s %s" "${date}" "$MONITOR_HOST" "$NEW_STATE")
  [ "$NEW_STATE" != "$CURRENT_STATE" ] && send_push "$MONITOR_HOST $NEW_STATE!" "${log}"|| printf "%s Nothing changed!\n" "${date}"
  export CURRENT_STATE=$NEW_STATE
}

while true; do
  main
  sleep 60 
done
