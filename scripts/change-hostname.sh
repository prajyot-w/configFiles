#!/bin/bash

sudo echo $1 > /etc/hostname
sudo sed -i "1i 127.0.1.1 $1" /etc/hosts
