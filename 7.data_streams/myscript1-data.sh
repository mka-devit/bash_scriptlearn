#!/bin/bash

release_file=/etc/os-release
err_log=/7.data_streams/err_log.txt
logfile=/7.data_streams/log.txt

if [[ -f $release_file ]] && grep -q "Ubuntu" $release_file; then
    sudo apt update >>$logfile 2>>$err_log && sudo apt upgrade -y >>$logfile 2>>$err_log
    if [ $? -ne 0 ]; then
        echo "An error occurred, please check the $err_log file."
    fi
fi

if [[ "$(uname)" == "Darwin" ]]; then
    if command -v brew &> /dev/null; then
        brew update >>$logfile 2>>$err_log && brew upgrade >>$logfile 2>>$err_log
        if [ $? -ne 0 ]; then
            echo "An error occurred, please check the $err_log file."
        fi
    fi
fi

if [[ -f $release_file ]] && grep -q "Arch" $release_file; then
    sudo pacman -Syu >>$logfile 2>>$err_log
    if [ $? -ne 0 ]; then
        echo "An error occurred, please check the $err_log file."
    fi
fi
