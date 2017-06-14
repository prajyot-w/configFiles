#!/bin/bash

# Setup for MODELN project in TECHBULLS PVT. LTD.

sudo apt-get update;
sudo apt-get build-dep git;
sudo apt-get install build-essential fakeroot dpkg-dev libcurl4-openssl-dev;

mkdir $HOME/git-openssl;
cd $HOME/git-openssl;

apt-get source git;
dpkg-source -x git*.dsc;
cd git-*;
sed -i 's/gnutls/openssl/g' debian/control;
sed -i '10d' debian/rules;
sudo dpkg-buildpackage -rfakeroot -b;

sudo dpkg -i $Home/git-openssl/git*amd64.deb;

sudo pip install awscli;

cd $HOME;
