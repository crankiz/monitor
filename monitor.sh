#!/bin/bash

HOST=crankiz.org
DATE=$(date "+%Y-%m-%d %H:%M:%S")
LOGPATH=/var/log/monitor/monitor.log
API="o.hIK92qEUqkDmvQxgFRirX1Qc8TnOZMnY"
URL="https://api.pushbullet.com/v2/pushes"

STATE="offline"
OLDSTATE=$(cat $LOGPATH | tail -1 | awk '{print $4}')
PINGCOUNT=$(ping -i 0.33 -c 3 $HOST|tail -2|head -1|awk '{print $4}')


pushbullet () {
  curl -s -u $API: -X POST $URL \
    --header 'Content-Type: application/json' \
    --data-binary '{"type": "note", "title": "'"$HOST is $STATE!"'", "body": "'"Host $STATE $DATE"'"}' >/dev/null 2>&1
}

check_state () {
  if [ "$PINGCOUNT" -gt 1 ]
    then
      STATE="online"
  fi
  echo "$DATE $HOST $STATE" >> $LOGPATH
}

check_state

if [ "$STATE" != "$OLDSTATE" ]
    then
      pushbullet
fi
