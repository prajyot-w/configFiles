## EXPORTS
export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export LC_ALL="en_US.UTF-8"
export GIT_EDITOR=nvim
export UPDATE_ZSH_DAYS=13

## OH-MY-ZSH configs
ZSH_THEME="af-magic"
ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)
source $ZSH/oh-my-zsh.sh

## ALIAS
alias ll='ls -lF'
alias la='ls -A'
alias ls='ls -CF --color=auto'
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

function cleanJetBrain() {
	INPUTDIR=$(echo $1 | sed 's/ //g');
	CONFIGDIR=$(ls -al ~ | grep -i $INPUTDIR | awk '{print $9}');
	if [ "$INPUTDIR" = "" -a "$CONFIGDIR" = "" ];
	then
		echo "Please Provide appropriate folder name."
	else
		echo "Cleaning"
		CONFIGDIR=$(echo $PWD/$CONFIGDIR | sed 's/\/$//g');
		rm -rf $CONFIGDIR/config/eval;
		echo -ne "$(cat $CONFIGDIR/config/options/options.xml | grep -v evlsprt)" > $CONFIGDIR/config/options/options.xml;
		CONFIGDIR=$(ls -al ~/.java/.userPrefs/jetbrains/ | grep -i datagrip | awk '{print $9}')
		CONFIGDIR=$(echo "$PWD/.java/.userPrefs/jetbrains/$CONFIGDIR" | sed 's/\/$//g')
		rm -rf $CONFIGDIR/*/evlsprt*;
	fi
}
