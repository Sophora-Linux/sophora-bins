#!/usr/bin/env bash
# sophara-edit
# Copyright (C) 2022 Wamuu Sudo (Orchid Linux)
#               2024 Babilinx <babilinx.evx1o@simplelogin.com> (Sophara Linux)
# This program is distributed under the terms of the GNU General Public License
# version 3. See <https://gnu.org/licenses/> for more.

source /usr/bin/gettext.sh
export TEXTDOMAIN="sophora-edit"


if [[ -z $EDITOR ]]; then
    eval_gettext "No default editor is given, defaulting to 'vi'."; echo
    EDITOR=vi
fi

$EDITOR /etc/portage/make.conf
