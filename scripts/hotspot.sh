#!/bin/bash

CURLOC=$PWD
cd /tmp
sudo rm -rf create_ap*
git clone https://github.com/oblique/create_ap
cd create_ap
sudo ./create_ap $1 $1 TP-LINK-21 55K7kx2f
cd $CURLOC
