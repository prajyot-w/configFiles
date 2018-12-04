#!/usr/bin/bash

## Extract NetWork Interface Subnet Mask
IPRANGE=$(ifconfig $1 | grep inet | head -n 1 | awk '{print $2}' | sed 's/\.[0-9]*$/\.0/g')/24

## Get All ssh enabled IP 
nmap -p 22 --open $IPRANGE | grep 'Nmap scan report for' | awk '{print $5}' > out.txt

## Get NetBIOS of all machines
cat out.txt | while read line; do
echo -e $line $(nmap --script smb-os-discovery $line | grep NetBIOS | awk '{print $5}') $(nmap --script nbstat.nse $line| grep NetBIOS | awk '{print $4}' )
done

