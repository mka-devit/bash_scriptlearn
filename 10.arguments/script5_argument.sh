#! /bin/bash

if [ $# -ne 1 ]
then
    echo "This script requires exactly one directory path passed to it."
    echo "Please try again."
    exit 1
fi

lines=$(ls -lh $1| wc -l)
echo "You have $(($lines)) objects in the $1 directory."
