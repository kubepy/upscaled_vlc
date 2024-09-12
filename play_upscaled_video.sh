#!/usr/bin/bash

function help() {
  echo "Usage: $0 /path/to/video.mp4"
}

function check_args() {
  if [ "$#" -ne 1 ]; then
    help
    exit 1
  fi
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    help
    exit 0
  fi
  if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 2
  fi
}

function check_dependencies() {
  if [ ! -x "$(command -v ffprobe)" ]; then
    echo "ffprobe not found"
    echo "Try \`sudo dnf install ffmpeg\` or similar"
    exit 10
  fi
  if [ ! -x "$(command -v gamescope)" ]; then
    echo "gamescope not found"
    echo "Try \`sudo dnf install gamescope\` or similar"
    exit 11
  fi
  if [ ! -x "$(command -v xdpyinfo)" ]; then
    echo "xdpyinfo not found"
    echo "Try \`sudo dnf install xdpyinfo\` or similar"
    exit 12
  fi
  if [ ! -x "$(command -v vlc)" ]; then
    echo "vlc not found"
    echo "Try \`sudo dnf install vlc\` or similar"
    exit 13
  fi
}

check_args "$@"
check_dependencies

VIDEO_FILE="$1"

IFS=x read VIDEO_WIDTH VIDEO_HEIGHT <<< $(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$VIDEO_FILE")
echo "Video resolution: ${VIDEO_WIDTH}x${VIDEO_HEIGHT}"

IFS=x read SCREEN_WIDTH SCREEN_HEIGHT <<< $(xdpyinfo | grep dimensions | awk '{print $2}')
echo "Screen resolution: ${SCREEN_WIDTH}x${SCREEN_HEIGHT}"

# Set VIDEO_WIDTH to match screen's aspect ratio
VIDEO_WIDTH=$((VIDEO_HEIGHT * SCREEN_WIDTH / SCREEN_HEIGHT))
echo "Adjusted video resolution: ${VIDEO_WIDTH}x${VIDEO_HEIGHT}"

gamescope \
  -w "$VIDEO_WIDTH" -h "$VIDEO_HEIGHT" \
  -W "$SCREEN_WIDTH" -H "$SCREEN_HEIGHT" \
  -F fsr \
  -f \
  -- vlc -f "$VIDEO_FILE"
