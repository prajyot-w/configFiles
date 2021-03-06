## EXPORTS
export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim
export LC_ALL="en_US.UTF-8"
export GIT_EDITOR=vim
export UPDATE_ZSH_DAYS=13

## OH-MY-ZSH configs
ZSH_THEME="af-magic"
# ZSH_THEME="refined"
ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)
source $ZSH/oh-my-zsh.sh

## ALIAS
alias ll='ls -laF --group-directories-first'
alias la='ls -A --group-directories-first'
alias ls='ls -CF --group-directories-first --color=auto'
alias grep='grep --color=auto'
alias cd..="cd .."
alias ..="cd .."
alias fhere="find . -name "
alias mkdir="mkdir -pv"
alias wget="wget -c"
alias histg="history | grep"
alias workspace="cd ~/workspace"
alias livehost="~/configFiles/scripts/livehosts.sh"
alias mycommits="git log --author=prajyot --oneline --pretty='%C(yellow)%h%Creset %C(bold blue)<%cd>%Creset %Cred%an%Creset %s'"
alias personcommits="git log --oneline --pretty='%C(yellow)%h%Creset %C(bold blue)<%cd>%Creset %Cred%an%Creset %s'"
alias nbon="bash $HOME/configFiles/scripts/netbios-on-network.sh enp2s0"
alias nbonw="bash $HOME/configFiles/scripts/netbios-on-network.sh wlp3s0"
alias gdtool="git difftool"
alias rsync="rsync --info=progress2"
alias blinkenlights="telnet towel.blinkenlights.nl"
alias mdepends="mvn dependency:tree"
alias psa='ps -Ao user,pid,tt,fname'
alias vboxmodprobe='sudo modprobe vboxnetflt && sudo modprobe vboxdrv'
alias jshell='/usr/lib/jvm/java-11-openjdk/bin/jshell -v'

## Color
alias diff="diff --color=auto"
alias ip="ip --color=auto"

## Functions
function commitConfig {
	cp ~/.zshrc ~/configFiles/;
	cp ~/.bashrc ~/configFiles/;
	cp ~/.vimrc ~/configFiles/;
  cp ~/.config/nvim/init.vim ~/configFiles/nvim.rc;
	cd ~/configFiles/;
	git add .;
	git commit; 
	git pull origin master;
	git push origin master;
	cd -;
}

function resetdatagrip() {
        CONFIG=$HOME/$(la -al ~ | grep -i datagrip | awk '{print $9}');
        USERPREF=$HOME/.java/.userPrefs/jetbrains/$(ls -al ~/.java/.userPrefs/jetbrains/ | grep -i datagrip | awk '{print $9}');
        echo "REMOVING $CONFIG/config/eval";
        rm -rf $CONFIG/config/eval;
        echo "REMOVING lines from $CONFIG/config/options/options.xml";
        echo -ne "$(cat $CONFIG/config/options/options.xml | grep -v evlsprt)" > $CONFIG/config/options/options.xml
        cd $USERPREF;
        echo "REMOVING evlsprt directorys from $USERPREF";
        find ./ -type d | grep -i evlsprt | while read line; do rm -rf $line; done
        cd -;
}

function resetintellij() {
        CONFIG=$HOME/$(la -al ~ | grep -i intellij | awk '{print $9}');
        USERPREF=$HOME/.java/.userPrefs/jetbrains/$(ls -al ~/.java/.userPrefs/jetbrains/ | grep -i idea | awk '{print $9}');
        echo "REMOVING $CONFIG/config/eval";
        rm -rf $CONFIG/config/eval;
        echo "REMOVING lines from $CONFIG/config/options/options.xml";
        echo -ne "$(cat $CONFIG/config/options/options.xml | grep -v evlsprt)" > $CONFIG/config/options/options.xml
        cd $USERPREF;
        echo "REMOVING evlsprt directorys from $USERPREF";
        find ./ -type d | grep -i evlsprt | while read line; do rm -rf $line; done
        cd -;
}

function enableTouchpad () {
	xinput set-prop $(xinput --list |grep -oP "Touchpad.*id=\K.*?(?=\s)") "Device Enabled" 1
}

function disableTouchpad () {
	xinput set-prop $(xinput --list |grep -oP "Touchpad.*id=\K.*?(?=\s)") "Device Enabled" 0
}

