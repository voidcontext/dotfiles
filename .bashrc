# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export NVM_DIR="/home/pgee/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use

source /usr/share/git-core/contrib/completion/git-prompt.sh

export PATH=$HOME/bin:$HOME/.composer/vendor/bin:$HOME/perl5/bin:$PATH
export PAGER=less
export EDITOR=/usr/bin/vim
export MYSQL_PS1="\u@\h [\d]> "
export HISTSIZE=10000
export HISTFILESIZE=10000

alias hd='hg diff -g'
alias shl="uptime | awk '{print \$10}' | sed 's/,$//'"

alias reload-profile='source ~/.bash_profile'
_showcolors () {
  for code in {0..255}; do 
    echo -e "\e[38;5;${code}m"'\\e[38;5;'"$code"m"\e[0m"
  done
}
alias show-colors='echo $(_showcolors)'

#export PS1='\u@\h \W> '
_color () {
  echo '\[\e['$1'm\]'
}

_color256 () {
  echo $(_color '38;5;'$1)
}



PS1=$(_color256 "29")
PS1+='\u'
PS1+=$(_color256 "208")
PS1+='@'
PS1+=$(_color256 "33")
PS1+='\h'
PS1+=$(_color256 "185")
PS1+=' \W$(__git_ps1)> '
PS1+=$(_color "0")

export PS1
