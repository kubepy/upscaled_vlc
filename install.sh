#!/usr/bin/bash

PROJECT_DIR=$(pwd)
if [ ! -f "$PROJECT_DIR/upscaled_vlc.sh" ]; then
  echo "Installing from GitHub"
  TMPDIR=$(mktemp -d)
  git clone https://github.com/adil192/upscaled_vlc "$TMPDIR/upscaled_vlc"
  PROJECT_DIR="$TMPDIR/upscaled_vlc"
else
  echo "Installing from local files"
fi

cp "$PROJECT_DIR/upscaled_vlc.sh" ~/.local/bin/
cp "$PROJECT_DIR/com.adilhanney.upscaled_vlc.desktop" ~/.local/share/applications/
mkdir -p ~/.local/share/icons/hicolor/scalable/apps/
cp "$PROJECT_DIR/com.adilhanney.upscaled_vlc.svg" ~/.local/share/icons/hicolor/scalable/apps/

rm -rf "$TMPDIR"
