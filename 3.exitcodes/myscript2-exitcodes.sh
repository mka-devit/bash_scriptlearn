#! /bin/bash

package=htop
brew install $package >> logfile.log # >> означает перенаправление вывода и сохраняет его в одельный файл

if [ $? -eq 0 ]
then
    echo "The installation of $package was successful"
    echo "The command is available here: "
    which $package
else
    echo "$package failed to install" >> logfile_err.log
fi