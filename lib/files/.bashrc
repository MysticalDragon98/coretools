HISTCONTROL=ignoredups
shopt -s histappend

PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
PATH=$PATH:$HOME/.bin
cd ~

if [ -f ~/.scripts/index.sh ]; then
    source ~/.scripts/index.sh
fi