#!/bin/bash

while true; do 
  inotifywait -qrm --event modify --format '%w' *.st | 
  gst hello.st;
  clear; 
done
