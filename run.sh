#!/bin/bash

HOME=/home/ubuntu
LOGNAME=ubuntu
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
LANG=en_US.UTF-8
SHELL=/bin/bash
PWD=/home/ubuntu
TODAY=$(date +%Y%m%d)
cd $HOME/voterfile
#date >> logs/log_$TODAY.txt 2>&1
./download.sh >> logs/log_$TODAY.txt 2>&1
./check.sh >> logs/log_$TODAY.txt 2>&1
