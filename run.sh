#!/bin/bash

TODAY=$(date +%Y%m%d)
cd /home/$USER/voterfile
./download.sh >> logs/log_$TODAY.txt 2>&1
./check.sh >> logs/log_$TODAY.txt 2>&1
./process.sh >> logs/log_$TODAY.txt 2>&1
./ec2_process.sh >> logs/log_$TODAY.txt 2>&1
