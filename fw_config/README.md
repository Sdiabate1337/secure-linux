# IPtables Rules
This script is used to reset the IPtables rules and set up a basic firewall configuration to block incoming traffic, except for specific ports and trusted IP addresses or subnets.

## Usage
To use this script, simply run it with root privileges:
```
sudo bash fw_config.sh
```

## Rules
### Reset IPtables Rules
The script first resets all IPtables rules to their default settings.

```
Copy code
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
```
### Block All Incoming Traffic
```
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
```
### Allow Incoming Traffic on Specific Ports
```
iptables -A INPUT -p tcp --port 22 -j ACCEPT #SSH
iptables -A INPUT -p tcp --port 80 -j ACCEPT #HTTP
iptables -A INPUT -p tcp --port 443 -j ACCEPT #HTTPS
```
### Allow Incoming Traffic from Trusted IP Addresses
```
iptables -A INPUT -s 1.2.3.4 -j ACCEPT
iptables -A INPUT -s 5.3.5.1 -j ACCEPT
```
### Allow Incoming Traffic from Trusted IP Subnets
```
iptables -A INPUT -s 1.0.0.0/8 -j ACCEPT
iptables -A INPUT -s 5.35.0.0/16 -j ACCEPT
```
### Allow Outgoing Traffic to All Destinations
```
iptables -A OUTPUT -j ACCEPT
```
### Enable Stateful Packet Inspection for Incoming Traffic
```
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
```
### Log Dropped Packets for Debugging Purposes
```
iptables -N LOGGING
iptables -A INPUT -j LOGGING
iptables -A LOGGING -m limit --limit 2/min -j LOG --log-prefix "Dropped Packets: " --log-level 7
iptables -A LOGGING -j DROP
```
### Save IPtables Rules
```
iptables-save > /etc/iptables.rules
```
## Note
This script provides a basic firewall configuration and is not a comprehensive solution. It is important to review the rules and adjust them according to your specific needs and security requirements.
