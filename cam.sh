#!/bin/bash

#example ./cam.sh video.webm /dev/video2

sudo modprobe v4l2loopback devices=1 max_buffers=2 card_label="fakewebcam" exclusive_caps=1 

INPUT=$1
DEVICE_WEBCAM=$2

while [ true ]; do
   read -t 1 -n 1
   if [ $? = 0 ]; then
      exit;
   else
	ffmpeg -v quiet -re -i $INPUT -map 0:v -f v4l2 $DEVICE_WEBCAM	
   fi
done
