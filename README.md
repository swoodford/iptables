iptables
========

A collection of scripts for automating various tasks with iptables

- **analyze-ip-relationships.php** Analyze a large list of IPs for potential relationships to help discover a botnet attacking servers
- **blacklist** List of IPs known to repeatedly attempt brute force SSH attacks
- **blacklistservers** List of server host name aliases to apply IPTables blocking
- **blacklistv6** List of IPv6 IPs known to repeatedly attempt brute force SSH attacks or exploit other vulnerabilities
- **cleanup-blacklist.sh** Sort CIDR IPs and removing duplicates and flagging invalid entries from the blacklist
- **ipblock.sh** Runs on the server side to apply iptables blocking
- **runipblock.sh** Run locally to apply iptables blocking on servers
