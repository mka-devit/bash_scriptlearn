#! /bin/bash

command=htop
if command -v $command #command -v проверяет наличие и доступность той или иной команды
then
    echo "$command is available, let's run it... "
else
    echo "$command is NOT available, install it..."
    brew install $command
fi

$command