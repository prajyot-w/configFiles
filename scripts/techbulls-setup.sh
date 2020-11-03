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
sudo apt-get install -y aptitude;
sudo apt-get install -y gimp git gitk gnome-tweak-tool gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly;
sudo apt-get install -y maven meld moc moc-ffmpeg-plugin mpack mpv;
sudo apt-get install -y nmap nodejs npm;
sudo apt-get install -y openjdk-8-jdk;
sudo apt-get install -y postgresql-client python-pip python-webkit python-webkit-dev;

# Switch shell to zsh as default shell for user and oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" ;


# Setup awscli
sudo pip install awscli;

cd $USER_HOME;

# Replace .zshrc file in home folder
rm -f $USER_HOME/.zshrc
cp $USER_HOME/configFiles/.zshrc $USER_HOME/

# Setup git user.name property for global variable.
git config --global user.name "Prajyot Walali"


echo "Setup Complete ... Please reboot your system.";
