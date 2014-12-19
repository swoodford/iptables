#!/bin/bash

# This script will read from the list of IPs and netblocks in the file blacklist 
# Then flush iptables to prevent duplication and block each IP or netblock specified

exec &>> ~/ipblock.log
echo "============================="
date '+%c'
echo "============================="

sudo /sbin/iptables -F
while read blacklist
do
  sudo /sbin/iptables -A INPUT -s $blacklist -j DROP
  echo iptables updated, $blacklist blocked
done < blacklist

sudo /sbin/ip6tables -F
while read blacklistv6
do
  sudo /sbin/ip6tables -A INPUT -s $blacklistv6 -j DROP
  echo ip6tables updated, $blacklistv6 blocked
done < blacklistv6
