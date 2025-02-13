#! /bin/bash

if [ $# -ne 2 ]
then
    echo "Usage: backup.sh <source_directory> <target_directory>"
    echo "Please try again"
    exit 1
fi

if ! command -v rsync > /dev/null 2>&1
then
    echo "This script requires rsync to be installed."
    echo "Please use your distribution's package manager to install rsync"
    exit 2
fi

current_date=$(date +%Y-%m-%d)
rsync_options="-avd --backup-dir $2/current_date --delete" #--dry-run # --dry-run это тестовый запуск ничего бэкапиться не будет
$(which rsync) $rsync_options $1 $2/current >> backup_$current_date.log