#!/bin/bash

TODAY=$(date +%Y%m%d)
old="downloads/old/voterfile.md5"
new="downloads/voterfile.md5"

if [ ! -f downloads/old/voterfile.md5 ]; then
        md5sum downloads/old/voterfile.csv | awk '{ print $1 }' > $old
fi
#if [ ! -f downloads/voterfile.md5 ]; then
	md5sum downloads/voterfile.csv | awk '{print $1}' > $new
#fi
if cmp -s "$old" "$new"; then
    printf 'No changes to the voterfile since last update. Deleting files and exiting'
    rm -f downloads/voterfile.md5
    rm -f downloads/voterfile.csv
    exit 1
else
    printf 'New voterfile - continuing!'
    date +%Y%m%d >> updateDates.txt
    mv downloads/voterfile.md5 downloads/old/voterfile.md5
    ./process.sh >> logs/log_$TODAY.txt 2>&1
fi
