#!/bin/bash

## Low key method to map lan
## for i in {1..254}; do ping -c 1 -W 1 192.168.0.$i; done | grep from | awk '{print $4}' | tr -d ":"

nmap $1 -n -sP | grep report | awk '{print $5}'
