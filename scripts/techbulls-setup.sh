#!/bin/bash

USER_HOME=$HOME

# Enable sources for apt
sudo sed -i 's/# deb-src/deb-src/g' /etc/apt/sources.list
sudo sed -i 's/#deb-src/deb-src/g' /etc/apt/sources.list
sudo sed -i 's/# deb/deb/g' /etc/apt/sources.list
sudo sed -i 's/#deb/deb/g' /etc/apt/sources.list

# System Setup 

sudo apt-get update;

# Installing Softwares ... 
sudo apt-get install -y vim;
sudo apt-get install -y zsh;
sudo apt-get install -y wget;
sudo apt-get install -y aptitude atom;
sudo apt-get install -y gimp git gitk gnome-tweak-tool gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly;
sudo apt-get install -y maven meld moc moc-ffmpeg-plugin mpack mpv;
sudo apt-get install -y mysql-client mysql-server mysql-utilities mysql-workbench;
sudo apt-get install -y nmap nodejs npm;
sudo apt-get install -y openjdk-8-jdk;
sudo apt-get install -y pinta postgresql-client python-pip python-webkit python-webkit-dev;
sudo apt-get install -y terminator testdisk tomcat7 unity-tweak-tool;
sudo apt-get install -y vim virtualbox virtualbox-ext-pack virtualbox-guest-additions-iso virtualbox-guest-dkms virtualbox-guest-utils;

# Switch shell to zsh as default shell for user and oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" ;


# Setup for MODELN project in TECHBULLS PVT. LTD.

sudo apt-get update;
sudo apt-get upgrade -y;
sudo apt-get build-dep git;
sudo apt-get install build-essential fakeroot dpkg-dev libcurl4-openssl-dev;

mkdir $USER_HOME/git-openssl;
cd $USER_HOME/git-openssl;

sudo apt-get source git;
sudo dpkg-source -x git*.dsc;
cd git-*;
sudo sed -i 's/gnutls/openssl/g' debian/control;
sudo sed -i '10d' debian/rules;
sudo dpkg-buildpackage -uc -us -rfakeroot -b;

sudo dpkg -i $USER_HOME/git-openssl/git*amd64.deb;

sudo pip install awscli;

cd $USER_HOME;


echo "Setup Complete ... Please reboot your system.";
