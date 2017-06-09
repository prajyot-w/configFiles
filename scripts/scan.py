#!/usr/bin/env python
import os
from time import sleep


def scan_info(ip_list):
	for x in ip_list:
		print "\n\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
		print "Scanning %s" % x
		cmd_string = "nmap --script nbstat.nse %s && nmap --script smb-os-discovery %s" %(x,x)
		os.system(cmd_string)
		sleep(30)


## scan for all available devices
if __name__ == "__main__":
	os.system("(nmap 192.168.0.0/24 -n -sP | grep report  | awk '{print $5}') > list")
	ip_list = open("list").readlines()
	os.remove("list")
	for x in range(len(ip_list)):
		ip_list[x] = ip_list[x][:-1]
	ip_list.reverse()
	scan_info(ip_list)
