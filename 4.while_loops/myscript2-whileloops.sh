#! /bin/bash

while [ -f ~/testfile ]
do
    echo "As of a $(date), the file exists" >> logfile.log
    sleep 5
done
    echo "As of a $(date), the file has gone missing"
