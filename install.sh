#!/usr/bin/bash

if [ ! -f "upscaled_vlc.sh" ]; then
  echo "Please run this script from the same directory as upscaled_vlc.sh"
  exit 1
fi

cp upscaled_vlc.sh ~/.local/bin/
cp com.adilhanney.upscaled_vlc.desktop ~/.local/share/applications/
mkdir -p ~/.local/share/icons/hicolor/scalable/apps/
cp com.adilhanney.upscaled_vlc.svg ~/.local/share/icons/hicolor/scalable/apps/
