#!/usr/bin/env bash
# sophora-grub-update
# Copyright (C) 2022 Wamuu Sudo (Orchid Linux)
#               2024 Babilinx <babilinx.evx1o@simplelogin.com>
# This program is distributed under the terms of the GNU General Public License
# version 3. See <https://gnu.org/licenses/> for more.

source /usr/bin/gettext.sh
export TEXTDOMAIN="sophora-grub-update"

eval_gettext "Updating GRUB configuration"; echo
grub-mkconfig -o /boot/grub/grub.cfg
