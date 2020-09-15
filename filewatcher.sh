#!/bin/bash

PID="-1"
FILE_EXT=$1
ARGS=("$@") 

mainAction() {
  [[ $PID != "-1" ]] && kill -9 $PID 2>/dev/null;
  SCRIPTS_AFTER_SECOND=("${ARGS[@]:2}")
  echo ${SCRIPTS_AFTER_SECOND[0]}
  PID=$!;
}

mainAction

while inotifywait -e modify $FILE_EXT; do
  mainAction
done
