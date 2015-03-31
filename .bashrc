# .bashrc
# vim: ts=2 sw=2 expandtab

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

echo $PATH | grep $USER\/bin > /dev/null

if [ "$?" == "1" ]; then
  echo "Patch path..."
  export PATH=$HOME/bin:$HOME/.composer/vendor/bin:$HOME/perl5/bin:$HOME/src/arcanist/bin:$PATH
fi

export PAGER=less
export EDITOR=/usr/bin/vim
export MYSQL_PS1="\u@\h [\d]> "
export HISTSIZE=10000
export HISTFILESIZE=10000

npm_delete_log() {
    npm "$@"; rm -f npm-debug.log
}

alias hd='hg diff -g'
alias hs='hg stat $(hg root)'
alias shl="uptime | awk '{print \$10}' | sed 's/,$//'"
alias cal='cal -m'
alias snpm=npm_delete_log
alias alpine="PROMPT_COMMAND='echo -ne \"\\033]0;alpine\\007\"'; alpine" 

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

hg_ps1 () {
  hg prompt " { on {branch}}{ at {bookmark}}{status}" 2> /dev/null
}

select_ps1 () {
  case $1 in
    default)
      echo '[\u@\h \W] '
      ;;
    color)

      echo -n $(_color256 "246")
      echo -n '\u'
      echo -n $(_color256 "254")
      echo -n '@'
      echo -n $(_color256 "29")
      echo -n '\h'
      echo -n $(_color256 "166")
      echo -n ' \W>'
      echo -n $(_color "0")
      echo -n ' '
     ;;
  esac;

}

#export PS1=$(select_ps1 color)
#alias ps1-default='export PS1=$(select_ps1 default)';
#alias ps1-color='export PS1=$(select_ps1 color)';

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
