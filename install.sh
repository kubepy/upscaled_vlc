#!/usr/bin/bash

SYMLINK=0
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  echo "Usage: $0"
  echo "To view this help message:"
  echo "    $0 --help"
  echo "To symlink instead of copying the files:"
  echo "    $0 -s"
  exit 0
elif [ "$1" = "-s" ] || [ "$1" = "--symlink" ]; then
  SYMLINK=1
fi

PROJECT_DIR=$(pwd)
if [ ! -f "$PROJECT_DIR/upscaled_vlc.sh" ]; then
  echo "Installing from GitHub"
  TMPDIR=$(mktemp -d)
  git clone https://github.com/adil192/upscaled_vlc "$TMPDIR/upscaled_vlc"
  PROJECT_DIR="$TMPDIR/upscaled_vlc"
  SYMLINK=0 # Don't symlink to temp dir
else
  echo "Installing from local files"
fi

function cp_or_symlink() {
  if [ $SYMLINK -eq 1 ]; then
    echo "ln -sf $@"
    ln -sf "$@"
  else
    echo "cp $@"
    cp "$@"
  fi
}

mkdir -p ~/.local/bin/
cp_or_symlink "$PROJECT_DIR/upscaled_vlc.sh" ~/.local/bin/
mkdir -p ~/.local/share/applications/
cp_or_symlink "$PROJECT_DIR/com.adilhanney.upscaled_vlc.desktop" ~/.local/share/applications/
mkdir -p ~/.local/share/icons/hicolor/scalable/apps/
cp_or_symlink "$PROJECT_DIR/com.adilhanney.upscaled_vlc.svg" ~/.local/share/icons/hicolor/scalable/apps/

rm -rf "$TMPDIR"
