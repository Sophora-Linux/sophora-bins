#!/usr/bin/env bash
# sophora-update
# Copyright (C) 2022 Wammu Sudo (Orchid Linux)
#               2024 Babilinx <babilinx.evx1o@simplelogin.com>
# This program is distributed under the terms of the GNU General Public License
# version 3. See <https://gnu.org/licenses/> for more.

source /usr/bin/gettext.sh
export TEXTDOMAIN="sophora-update"


if [ "$EUID" -ne 0 ]; then
    eval_gettext "This program needs root rights!"; echo
    exit 1
fi

eval_gettext "Syncing of repositories..."; echo
if ! emerge --sync -q && eix-sync -q; then
    eval_gettext "Failed to sync repos!"; echo
    exit 1
fi

eval_gettext "Updating packages..."; echo
if ! emerge -qavuDN --with-bdeps=y --keep-going @world; then
    eval_gettext "Failed to updates packages!"; echo
    exit 1
fi
eval_gettext "Rebuilding modules that needs it..."; echo
if ! emerge -q @module-rebuild; then
    eval_gettext "Failed to rebuild modules!"; echo
    exit 1
fi
if flatpak --version &> /dev/null; then
    eval_gettext "Updating Flatpaks..."; echo
    if ! flatpak update -y; then
        eval_gettext "Failed to update Flatpaks!"; echo
        exit 1
    fi
fi

eval_gettext "Updating GRUB config..."; echo
if ! sophora-grub-update; then
    eval_gettext "Failed to update GRUB!"; echo
    exit 1
fi

eval_gettext "Removing unused packages..."; echo
if ! emerge -cq; then
    eval_gettext "Failed to remove unused packages!"
    exit 1
fi

eval_gettext "Updating Sophora version..."; echo
if ! sophora-version-update; then
    eval_gettext "Failed to update Sophora version!"; echo
    exit 1
fi

