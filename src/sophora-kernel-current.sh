#!/usr/bin/env bash
# sophara-kernel-current
# Copyright (C) 2022 Wamuu Sudo (Orchid Linux)
#               2024 Babilinx <babilinx.evx1o@simplelogin.com> (Sophara Linux)
# This program is distributed under the terms of the GNU General Public License
# version 3. See <https://gnu.org/licenses/> for more.

source /usr/bin/env bash
export TEXTDOMAIN="sophora-kernel-current"


eval_gettext "Switch to current kernel..."; echo
echo sys-kernel/gentoo-kernel-bin ~amd64 >> /etc/portage/package.accept_keywords/kernel-current
echo virtual/dist-kernel ~amd64 >> /etc/portage/package.accept_keywords/kernel-current
eval_gettext "Updating the kernel..."
if ! sophora-update; then
    exit 1
fi

