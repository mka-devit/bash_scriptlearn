#!/bin/bash

release_file=/etc/os-release

if [[ -f $release_file ]] && grep -q "Ubuntu" $release_file; then
    sudo apt update
    sudo apt upgrade -y
fi

if [[ "$(uname)" == "Darwin" ]]; then
    # Обновление пакетов Homebrew
    if command -v brew &> /dev/null; then
        brew update
        brew upgrade
    fi
fi

if [[ -f $release_file ]] && grep -q "Arch" $release_file; then
    sudo pacman -Syu
fi