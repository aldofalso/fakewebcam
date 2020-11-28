#!/bin/sh

sudo modprobe v4l2loopback devices=1 video_nr=10 max_buffers=2 card_label="virtualwebcam" exclusive_caps=1 

INPUT=$1

if [ "${INPUT##*.}" = "webm" ] || [ "${INPUT##*.}" = "mp4" ] || [ "${INPUT##*.}" = "gif" ]; then
  		ffmpeg -re -stream_loop -1 -hwaccel vulkan -i $INPUT -f v4l2 -pix_fmt yuv420p -vf hflip /dev/video10

	elif [ "${INPUT##*.}" = "jpeg" ] || [ "${INPUT##*.}" = "jpg" ] || [ "${INPUT##*.}" = "png" ]; then
	        ffmpeg -loop 1 -re -i $INPUT -f v4l2 -vcodec rawvideo -pix_fmt yuv420p -vf hflip /dev/video10
fi
