#!/bin/bash

# Reset iptables rules
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X

# Block all incoming traffic
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Allow incoming traffic on specific ports
iptables -A INPUT -p tcp --port 22 -j ACCEPT #SSH
iptables -A INPUT -p tcp --port 80 -j ACCEPT #HTTP
iptables -A INPUT -p tcp --port 443 -j ACCEPT #HTTPS

# Allow incoming traffic from trusted IP addresses
iptables -A INPUT -s 1.2.3.4 -j ACCEPT
iptables -A INPUT -s 5.3.5.1 -j ACCEPT

# Allow incoming traffic from trusted IP subnets
iptables -A INPUT -s 1.0.0.0/8 -j ACCEPT
iptables -A INPUT -s 5.35.0.0/16 -j ACCEPT

# Allow outgoing traffic to all destinations
iptables -A OUTPUT -j ACCEPT

# Enable stateful packet inspection for incoming traffic
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Log dropped packets for debugging purposes
iptables -N LOGGING
iptables -A INPUT -j LOGGING
iptables -A LOGGING -m limit --limit 2/min -j LOG --log-prefix "Dropped Packets: " --log-level 7
iptables -A LOGGING -j DROP

# Save iptables rules
iptables-save > /etc/iptables.rules





