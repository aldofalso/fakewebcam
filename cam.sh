#!/bin/bash

#example ./cam.sh video.webm /dev/video10

sudo modprobe v4l2loopback devices=1 video_nr=10 max_buffers=2 card_label="fakewebcam" exclusive_caps=1 

INPUT=$1

while [ true ]; do
   read -t 1 -n 1
   if [ $? = 0 ]; then
      exit;
   else
	ffmpeg -re -stream_loop -1 -hwaccel vulkan -i $INPUT -f v4l2 -pix_fmt yuv420p /dev/video10
   fi
done
