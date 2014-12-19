#!/bin/bash

# This script will read from the list of servers in the file blacklistservers
# copy the block list and block script to each server specified in the list
# then execute the script ipblock.sh to block the servers

while read blacklistservers
do
  scp ipblock.sh blacklist blacklistv6 $blacklistservers:~
  echo Blocking IPs on $blacklistservers
  ssh -n $blacklistservers '(./ipblock.sh &)'
  # need to test for success/failure here
  echo $blacklistservers Done
done < blacklistservers
