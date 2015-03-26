iptables
========

A collection of scripts for automating various tasks with iptables

[![Build Status](https://travis-ci.org/swoodford/iptables.svg?branch=master)](https://travis-ci.org/swoodford/iptables)

- **analyze-ip-relationships.php** Analyze a large list of IPs for potential relationships to help discover a botnet attacking servers
- **blacklist** List of IPs known to repeatedly attempt brute force SSH attacks or exploit other vulnerabilities
- **blacklistservers** List of server host name aliases to apply iptables blocking
- **blacklistv6** List of IPv6 IPs known to repeatedly attempt brute force SSH attacks or exploit other vulnerabilities
- **cidr-blacklist.sh** Add CIDR notation to any IPs on blacklist missing /32 /24 or /14 CIDR notation
- **cleanup-blacklist.sh** Sort CIDR IPs and removing duplicates and flagging invalid entries from the blacklist
- **ipblock.sh** Runs on the server side to apply iptables blocking
- **runipblock.sh** Run locally to apply iptables blocking on servers
