# upscaled_vlc

This is a simple script that allows real-time video upscaling on Linux
using
[VLC media player](https://www.videolan.org/vlc/)
and FSR via Valve's
[gamescope](https://github.com/ValveSoftware/gamescope).

## Usage

After [installing](#install),
simply right click on a video in your file manager
and open it with Upscaled VLC.

See [the gamescope repo](https://github.com/ValveSoftware/gamescope#keyboard-shortcuts) for the available keyboard controls.

<img src="https://github.com/user-attachments/assets/ee8ae007-0752-4bcf-b67e-0dd3b6ffb076" width="500" alt="The Open File window showing Upscaled VLC as an option.">

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

    Or alternatively, as a one-liner:

    ```bash
    wget -O - https://raw.githubusercontent.com/adil192/upscaled_vlc/main/install.sh | bash
    ```

## Uninstall

If you cloned the repo:
```bash
cd upscaled_vlc
./uninstall.sh
```

Alternatively, as a one-liner:

```bash
wget -O - https://raw.githubusercontent.com/adil192/upscaled_vlc/main/uninstall.sh | bash
```

## Disclaimer

This project is not affiliated with VideoLAN, VLC, Valve, or gamescope.