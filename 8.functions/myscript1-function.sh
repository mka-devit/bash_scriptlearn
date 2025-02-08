#! /bin/bash

release_file=/etc/os-release
err_log=/Users/maksim/Documents/WORK/Bash_L/8.functions/err_log.txt
logfile=/Users/maksim/Documents/WORK/Bash_L/8.functions/log.txt


check_status () {
if [ $? -ne 0 ]; then
    echo "An error occurred, please check the $err_log file."
fi
}


if [[ -f $release_file ]] && grep -q "Ubuntu" $release_file; then
    sudo apt update >>$logfile 2>>$err_log && sudo apt upgrade -y >>$logfile 2>>$err_log
    check_status
fi

if [[ "$(uname)" == "Darwin" ]]; then
    if command -v brew &> /dev/null; then
        brew update >>$logfile 2>>$err_log && brew upgrade >>$logfile 2>>$err_log
        check_status
    fi
fi

if [[ -f $release_file ]] && grep -q "Arch" $release_file; then
    sudo pacman -Syu >>$logfile 2>>$err_log
    check_status
fi
