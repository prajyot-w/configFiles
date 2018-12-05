#!/usr/bin/env python3

import subprocess
from sys import argv
import json

def scanForIPWithOpenPorts(iprange, portno):
    _command = "nmap -p %s --open %s | grep 'Nmap scan report for' | awk '{print $5}'" %(portno, iprange)
    try:
        _ips = subprocess.getoutput(_command).strip().split("\n")
    except Exception:
        return None
    return _ips

def resolveNetBiosName(ip):
    _command = "nmblookup -A %s | head -n 2 | grep ACTIVE | awk '{print $1}'" %(ip)

    try:
        result = subprocess.getoutput(_command).strip()
    except Exception:
        result = None

    if(result == None):
        return ""
    else:
        return result

def dumpResultToFile(result):
    outfile = open("out.txt", "w")
    outfile.write(json.dumps(result))

if __name__ == "__main__":
    _script = argv[0]
    _portprovided = False
    _all_machines = []
    _netbios_names = {}

    try:
        _iprange = argv[1]
    except Exception as identifier:
        print("Please provide appropriate ip / ip range")
        exit()

    try:
        if ( argv[2] == "-p" and argv[3] != ""):
            _portno = argv[3]
            _portprovided = True
    except Exception as identifier:
            _portno = "445"
    
    ## Get all IP's on network
    if(_portprovided):
        print("Scanning on port %s\n" %(_portno))
        _all_machines.extend(scanForIPWithOpenPorts(_iprange, _portno))
    else:
        print("Scanning on port 445 and 22\n")
        _all_machines.extend(scanForIPWithOpenPorts(_iprange, "445"))
        _all_machines.extend(scanForIPWithOpenPorts(_iprange, "22"))

    ## All Unique values
    _all_machines = list(set(_all_machines))
    
    ## Get netbios names 
    for machine in _all_machines:
        _netbios_names[machine] = resolveNetBiosName(machine)

    print(_netbios_names)
    print("\n... dumping result to out.txt file.")    
    dumpResultToFile(_netbios_names)