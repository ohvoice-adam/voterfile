#!/bin/bash

TODAY=$(date +%Y%m%d)
cd /home/adam/voters
./download.sh >> logs/log_$TODAY.txt 2>&1
./check.sh >> logs/log_$TODAY.txt 2>&1
