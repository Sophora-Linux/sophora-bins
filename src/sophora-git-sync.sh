#!/usr/bin/env bash
# sophora-git-sync
# Copyright (C) 2022 Wamuu Sudo (Orchid Linux)
#               2024 Babilinx <babilinx.evx1o@simplelogin.com> (Sophora Linux)
# This program is distributed under the terms of the GNU General Public License
# version 3. See <https://gnu.org/licenses/> for more.

source /usr/bin/gettext.sh
export TEXTDOMAIN="sophora-git-sync"


if [ "$EUID" -ne 0 ]; then
    eval_gettext "This program needs root rights!"; echo
    exit 1
fi

eval_gettext "Checking for Git presence..."; echo
if ! git --version > /dev/null; then
    eval_gettext "Git not detected. Installing it..."; echo
    if ! sophora-install dev-vcs/git; then
        eval_gettext "Failed to install Git!"; echo
        exit 1
    fi
fi

eval_gettext "Cleaning of the old structure..."; echo
if ! eselect repository remove gentoo; then
    eval_gettext "Failed to remove Gentoo repo!"; echo
    exit 1
fi

eval_gettext "Removing of the old repository..."; echo
if ! rm -r /var/db/repos/gentoo; then
    eval_gettext "Failed to remove the old repository!"; echo
    exit 1
fi

eval_gettext "Enableing gentoo repo with Git..."; echo
if ! eselect repository enable gentoo; then
    eval_gettext "Failed to enable Gentoo repo!"; echo
    exit 1
fi

eval_gettext "Syncing the new repo..."; echo
if ! emaint sync -r gentoo; then
    eval_gettext "Failed to sync the new repo!"
    exit 1
fi

