#!/bin/bash

PID="-1"
FILE_EXT="$1"
SCRIPT_WILL_BE_EXECUTED="$2"

mainAction() {
  [[ $PID != "-1" ]] && kill -9 $PID 2>/dev/null;
  $SCRIPT_WILL_BE_EXECUTED &
  PID=$!;
}

mainAction

while inotifywait -e modify $FILE_EXT; do
  mainAction
done
