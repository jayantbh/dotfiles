export ZSH=/Users/jayant/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias rm='rm -rf'
alias ..='cd ..'
alias watch='watch '

# Custom Aliases
alias gb='git branch'
alias gf='git fetch'
alias gs='git status'
alias gcb='gb | egrep -o "\* .+" | egrep -o "[a-zA-Z0-9\-]+"'
alias gp='git push'
alias gd='gf && git pull -r origin'
alias gu='gp origin $(gcb)'
alias guf='gp origin +$(gcb)'
alias go='git checkout'
alias gc='git commit -am \"$(gcb) $\1"'
alias gck='function __gck() { if [ -z "$1" ]; then echo "Missing commit message."; else git commit -am "$(gcb): $1"; fi; ret=$?; unset -f __gck; return $ret; }; __gck'
alias gca='git commit --amend -am ""'
alias gcam='git commit --amend -a '
alias gcuf='read -p "Enter commit message: " commit_msg; gc "$commit_msg" && guf'
alias gn='function __gn() { if [ -z "$1" ]; then echo "Missing branch regex."; else gb -D $(gb --list "$1"); fi; ret=$?; unset -f __gn; return $ret; }; __gn'
alias gcauf='gca && guf'
alias nig='sudo npm i -g'
alias sag='sudo apt-get'
alias sagi='sudo apt-get -y install'
alias space='watch -n 1 "df -h | grep /dev/disk1"'
alias ram='watch -n 1 free -h'
alias reterm='source ~/.zshrc'
alias fastboot='sudo fastboot'
alias fire='watch -n 0.5 '\"'sensors | tail -n 6 | head -n 1 | awk '\''{print(\$1,\$2,\$3,\$4)}'\'' && sensors | tail -n 5 | head -n 4 | awk '\''{print(\$1,\$2,\$3)}'\'''\"''
alias ft='read $instance && ember serve --proxy https://$instance.kayako.com --transparent-proxy false'
alias ft='function __ft() { if [ -z "$1" ]; then echo "Missing instance name."; else ember serve --proxy https://$1.kayako.com --transparent-proxy false; fi; ret=$?; unset -f __ft; return $ret; }; __ft'

alias ya='yarn add';
alias yi='yarn install';
alias yr='yarn remove';

function powerline_precmd() {
    PS1="$(~/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

eval $(thefuck --alias)

export PATH="$HOME/.yarn/bin:$PATH"
