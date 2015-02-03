#!/bin/bash
# This script will add CIDR notation to any IPs missing /32 /24 or /14 CIDR notation

while read blacklist
do
	echo $blacklist
	if ! echo $blacklist | egrep -q '/32$'; then
		if ! echo $blacklist | egrep -q '/24$'; then
			if ! echo $blacklist | egrep -q '/14$'; then
				echo $blacklist/32 >> blacklist3
			fi
		fi
	fi
done < blacklist
