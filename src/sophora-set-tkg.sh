#!/usr/bin/env bash
# sophora-set-tkg
# Copyright (C) 2022 Wamuu Sudo
#               2024 Babilinx <babilinx.evx1o@simplelogin.com>
# This program is distributed under the terms of the GNU General Public License
# version 3. See <https://gnu.org/licenses/> for more.

source /usr/bin/gettext.sh
export TEXTDOMAIN="sophora-set-tkg"

TKG_DIR="/usr/share/sophara/tools/tkg"


eval_gettext "Installing necessary packages..."; echo
if ! emerge -q app-arch/lz4 schedtool; then
    eval_gettext "Failed to install necessary packages!"; echo
    exit 1
fi

cd "$TKG_DIR"
eval_gettext "Adapting TKG config..."; echo
if ! sed "/_configfile=/c\_configfile=\"running-kernel\"" $TKG_DIR/customization.cfg > tmp.cfg; then
    eval_gettext "Failed to edit TKG config!"; echo
    exit 1
fi

cp tmp.cfg $TKG_DIR/customization.cfg
rm -f tmp.cfg

eval_gettext "Updating TKG kernel versions..."; echo
if ! ./update-kernel-versions.sh; then
    eval_gettext "Failed to update TKG kernel versions!"; echo
    exit 1
fi

eval_gettext "Installing TKG kernel..."; echo
if ! ./install.sh install; then
    eval_gettext "Failed to install TKG kernel!"; echo
    exit 1
fi

eval_gettext "Installation of TKG kernel done! Reboot to boot it."; echo

