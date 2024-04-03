#!/usr/bin/env bash
# sophara-nvidia
# Copyright (C) 2022 Wamuu Sudo
#               2024 Babilinx <babilinx.evx1o@simplelogin.com>
# This program is distributed under the terms of the GNU General Public License
# version 3. See <https://gnu.org/licenses/> for more.

source /usr/bin/gettext.sh
export TEXTDOMAIN="sophora-nvidia"


eval_gettext "Unmasking latest NVIDIA drivers..."; echo
echo "media-video/ffmpeg nvenc" >> /etc/portage/package.use/nvenc
echo "x11-drivers/nvidia-drivers ~amd64" >> /etc/portage/package.accept_keywords/nvidia-drivers
echo media-video/nvidia-video-codec ~amd64 >> /etc/portage/package.accept_keywords/nvidia-video-codec
# Install NVIDIA Settings
echo "x11-drivers/nvidia-drivers tools" >> /etc/portage/package.use/nvidia-drivers

if ! euse -E nvenc; then
    eval_gettext "Failed to activate 'nvenc' USEflag!"; echo
    exit 1
fi
if ! emerge -avuN nvidia-drivers nvidia-video-codec nvidia-video-codec ffmpeg dev-util/nvidia-cuda-toolkit; then
    eval_gettext "Failed to install NVIDIA drivers!"; echo
    exit 1
fi
if ! sophora-update; then
    eval_gettext "Failed to update the system!"; echo
    exit 1
fi

