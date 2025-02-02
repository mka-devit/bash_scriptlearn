#! /bin/bash

directory=/etc/dkwpd
if [ -d $directory ]
then
    echo "The directory $directory exists."
else
    echo "The exit code: $?"
    echo "The directory doen't exists."
fi
echo "The exit code: $?" #Пример не правильного кода выхода так как код выхода показывает код последней выполненой команды
