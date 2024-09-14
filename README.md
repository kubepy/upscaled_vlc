# upscaled_vlc

This is a simple script that allows real-time video upscaling on Linux
using
[VLC media player](https://www.videolan.org/vlc/)
and FSR via Valve's
[gamescope](https://github.com/ValveSoftware/gamescope).

## Usage

After installing,
simply right click on a video in your file manager
and open it with Upscaled VLC.

## Install

1. Install the dependencies:

    ```bash
    # E.g. on Fedora:
    sudo dnf install ffmpeg xdpyinfo vlc gamescope
    ```

2. Install upscaled_vlc:

    ```bash
    git clone https://github.com/adil192/upscaled_vlc
    cd upscaled_vlc
    ./install.sh
    ```

    Or alternatively, in one line:

    ```bash
    wget -O - https://raw.githubusercontent.com/adil192/upscaled_vlc/main/install.sh | bash
    ```

## Disclaimer

This project is not affiliated with VideoLAN, VLC, Valve, or gamescope.