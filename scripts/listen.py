#!/usr/bin/env python
from socket import *

s=socket(AF_INET,SOCK_DGRAM)
s.bind(('',12345))
m=s.recvfrom(1024)
print m[0]
