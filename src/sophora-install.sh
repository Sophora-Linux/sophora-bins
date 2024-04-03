#!/usr/bin/env bash
# sophara-install
# Copyright (C) 2022 Wamuu Sudo (Orchid Linux)
#               2022 Yannick Defais [Chevek] (Orchid Linux)
#               2024 Babilinx <babilinx.evx1o@simplelogin.com> (Sophora Linux)
# This program is distributed under the terms of the GNU General Public License
# version 3. See <https://gnu.org/licenses/> for more.

source /usr/bin/gettext.sh
export TEXTDOMAIN="sophora-install"


eval_gettext "Installing ${@}..."; echo
if ! emerge -qav --autounmask-write --autounmask=y $@; then
    exit 1
fi
