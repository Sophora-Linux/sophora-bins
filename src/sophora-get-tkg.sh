#!/usr/bin/env bash
# sophora-get-tkg
# Copyright (C) 2022 Wamuu Sudo (Orchid Linux)
#               2024 Babilinx <babilinx.evx1o@simplelogin.com> (Sophora Linux)
# This program is distributed under the terms of the GNU General Public License
# version 3. See <https://gnu.org/licenses/> for more.

source /usr/bin/gettext.sh
export TEXTDOMAIN="sophora-get-tkg"

TKG_DIR="/usr/share/sophora/tools/tkg"
TKG_REPO="https://github.com/Frogging-Family/linux-tkg"


if [ -d "$TKG_DIR" ]; then
    mkdir -p "$TKG_DIR"
fi

eval_gettext "Cloning TKG Git repo..."; echo
if ! git clone "$TKG_REPO" "$TKG_DIR" &> /dev/null; then
    eval_gettext "Cloning went wrong!"; echo
    exit 1
fi

cd "$TKG_DIR"
eval_gettext "Updating TKG kernel versions..."; echo
if ! ./update-kernel-versions.sh; then
    exit 1
fi

