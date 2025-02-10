#! /bin/bash

lines=$(ls -lh $1| wc -l)
echo "You have $(($lines)) objects in the $1 directory."