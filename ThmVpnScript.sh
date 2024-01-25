#!/bin/bash

# write a script that automate the vpn connection for THM, including these steps

echo "connection is: "
warp-cli connect 

read -p "Enter your THM-VPN file: " THMVPN

echo "Your Host IP is: "
hostname -i

sudo openvpn $THMVPN &>/dev/null & disown;

read -p "Enter IP you want to connect: " IP

ping $IP

echo "disconnection is: "

warp-cli disconnect 

ssh tryhackme@$IP