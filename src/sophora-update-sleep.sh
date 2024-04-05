#!/usr/bin/env bash
# Copyright (C) 2022 Wamuu Sudo (Orchid Linux)
#               2024 Babilinx <babilinx.evx1o@simplelogin.com>
# This program is distributed under the terms of the GNU General Public License
# version 3. See <https://gnu.org/licenses/> for more.

source /ur/bin/gettext.sh
export TEXTDOMAIN="sophora-update"

LOG_FILE="/var/log/sophara-update-sleep.log"


if [ "$EUID" -ne 0 ]; then
    eval_gettext "This program needs root rights!"; echo
    exit 1
fi

echo >> $LOG_FILE
echo "----" >> $LOG_FILE
eval_gettext "Starting Sophora system update..." >> $LOG_FILE
date +'%a. %d %b. %T' >> $LOG_FILE
if sophara-update &>> $LOG_FILE; then
    eval_gettext "System updated!" | tee -a $LOG_FILE
fi

eval_gettext "Shutting the system down..." | tee -a $LOG_FILE
poweroff

date +'%a. %d %b. %T' >> $LOG_FILE
echo "----" >> $LOG_FILE


