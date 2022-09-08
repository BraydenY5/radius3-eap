#!/bin/bash
#set -x
LOOP=127.0.0.1
iptables -P OUTPUT DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -F
iptables -F -t nat
iptables -X
iptables -Z
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -s 127.0.0.1/32 -j ACCEPT
iptables -A INPUT -d 127.0.0.1/32 -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
iptables -A INPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT
#iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dports 22,80   -j ACCEPT
iptables -A INPUT -p udp -m multiport --dports 123,1812,1813   -j ACCEPT




iptables-save  > /etc/sysconfig/iptables
ip6tables -P OUTPUT DROP
ip6tables -P INPUT DROP
ip6tables -P FORWARD DROP
ip6tables-save  > /etc/sysconfig/ip6tables
