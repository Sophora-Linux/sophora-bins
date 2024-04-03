#!/usr/bin/env bash
# sophora-delete
# Copyright (C) 2022 Wamuu Sudo (Orchid Linux)
#               2024 Babilinx <babilinx.evx1o@simplelogin.com> (Sophora Linux)
# 
# This program is distributed under the terms of the GNU General Public License
# version 3. See <https://gnu.org/licenses/> for more.

source /usr/bin/gettext.sh
export TEXTDOMAIN="sophora-delete"


if [[ "$1" == "--break-system" ]]; then
    unmerge="emerge -ac"
    packages=( "${@/--break-system}" )
else
    unmerge="emerge -aC"
    packages="$@"
fi

eval_gettext "Removing \${packages}..."; echo
if ! $unmerge $packages; then
    exit 1
fi

eval_gettext "Removing dependencies..."; echo
if ! emerge --ac; then
    exit 1
fi

