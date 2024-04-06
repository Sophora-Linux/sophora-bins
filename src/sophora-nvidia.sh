#!/usr/bin/env bash
# sophara-nvidia
# Copyright (C) 2022 Wamuu Sudo
#               2024 Babilinx <babilinx.evx1o@simplelogin.com>
# This program is distributed under the terms of the GNU General Public License
# version 3. See <https://gnu.org/licenses/> for more.

source /usr/bin/gettext.sh
export TEXTDOMAIN="sophora-nvidia"


if [ "$EUID" -ne 0 ]; then
    eval_gettext "This program needs root rights!"; echo
    exit 1
fi

eval_gettext "Adapting USEflags for NVIDIA drivers..."; echo
echo "media-video/ffmpeg nvenc" >> /etc/portage/package.use/nvenc
# Install NVIDIA Settings
echo "x11-drivers/nvidia-drivers tools" >> /etc/portage/package.use/nvidia-drivers

if ! euse -E nvenc; then
    eval_gettext "Failed to activate 'nvenc' USEflag!"; echo
    exit 1
fi
if ! emerge -avuN nvidia-drivers media-libs/nv-codec-headers ffmpeg dev-util/nvidia-cuda-toolkit media-libs/nvidia-vaapi-driver; then
    eval_gettext "Failed to install NVIDIA drivers!"; echo
    exit 1
fi
if ! sophora-update; then
    eval_gettext "Failed to update the system!"; echo
    exit 1
fi

