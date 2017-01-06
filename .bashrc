PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[01;31m\]\$\[\033[00m\] '
PS2='\[\033[01;33m\]$>\[\033[00m\] '

## ALIAS
alias ll='ls -alF'
alias la='ls -A'
alias ls='ls -CF --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cd..="cd .."
alias ..="cd .."
alias fhere="find . -name "
alias mkdir="mkdir -pv"
alias wget="wget -c"
alias histg="history | grep"
alias cdw="cd ~/workspace"
alias livehost="~/.scripts/livehosts.sh"
