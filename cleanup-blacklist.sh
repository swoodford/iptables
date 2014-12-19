#!/bin/bash
# This script will sort CIDR IPs and removing duplicates and flagging invalid entries from the blacklist

function failed(){
	echo "Blacklist cleanup failed."
	exit 1
}

function internal(){
	echo "One or more lines contain an internal IP. Please fix line:"
}

function invalid(){
	echo "One or more lines contain an invalid IP. Please fix line:"
}

# Validates CIDR notation
if grep -qv '/[0-9]' blacklist; then
	echo "One or more lines contain invalid or missing CIDR notation. Please fix line:"
	grep -vn '/[0-9]' blacklist
	failed
fi

# Checks for 10.x.x.x internal IPs
if grep -q '^[1][0]\.' blacklist; then
	internal
	grep -n '^[1][0]\.' blacklist
	failed
fi

# Checks for 172.x.x.x internal IPs
if grep -q '^[1][7][2]\.[1,2,3][0-9]\.' blacklist; then
	internal
	grep -n '^[1][7][2]\.[1,2,3][0-9]\.' blacklist
	failed
fi

# Checks for 192.168.x.x internal IPs
if grep -q '^[1][9][2]\.[1][6][8]' blacklist; then
	internal
	grep -n '^[1][9][2]\.[1][6][8]' blacklist
	failed
fi

# Checks for 169.254.x.x invalid IPs
if grep -q '^[1][6][9]\.[2][5][4]' blacklist; then
	invalid
	grep -n '^[1][6][9]\.[2][5][4]' blacklist
	failed
fi

# Checks for your own current IP
if grep -q $(curl -s http://icanhazip.com/) blacklist; then
	invalid
	grep -n $(curl -s http://icanhazip.com/) blacklist
	failed
fi

# Cleanup functions
sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 blacklist | uniq > blacklist2
mv blacklist2 blacklist

echo "Blacklist cleanup completed."
