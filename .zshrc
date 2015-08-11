#   PATHS
export ZSH=$HOME/.zsh

NODEBREW_BIN="$HOME/.nodebrew/current/bin"
RUBY_BIN="/usr/local/opt/ruby/bin"
PYTHON_BIN="/usr/local/lib/python2.7/site-packages"
NODE_BIN="$HOME/.node/bin"
HEROKU_BIN="/usr/local/heroku/bin"
export PATH="$PATH:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:/usr/local/sbin:$NODEBREW_BIN:$RUBY_BIN:$PYTHON_BIN:$NODE_BIN:$RBENV_BIN:$HEROKU_BIN"

export NODEBREW_ROOT=/usr/local/var/nodebrew
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

# QFC
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"
qfc_quick_command 'cd' '\C-b' 'cd $0'
qfc_quick_command 'vim' '\C-p' 'vim $0'

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
#   THEMES
ZSH_THEME="mh" #mh

#   PLUGINS
plugins=(git compleat zsh-git-sync alias-tips osx)

source $ZSH/oh-my-zsh.sh

#   SSH
export SSH_KEY_PATH="~/.ssh/dsa_id"
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='mvim'
fi


#   ALIASES
alias subl="~/bin/subl"
alias p="python $1"
alias ga"git add . -A"
alias gph="git push heroku master"
alias sl="ls"
alias cm="git add . -A && git commit -m"
alias gc="git commit -m $1"
alias gs="git status"
alias gp="git push -u origin master"
alias cddoc="cd /Users/devan/Documents/school/14-15/su15"
alias cdsp="cd /Users/devan/Documents/school/14-15/sp15/senior_project/senior_website"
alias szh="source ~/.zshrc"
alias brewup="sh ~/bin/brewup.sh"
alias cdpw="cd ~/Documents/personal_website/static"
alias vz="vim ~/.zshrc"
alias vv="vim ~/.vimrc"
alias npm="sudo npm"
alias rr="rm -fr"
alias wifipass="security find-generic-password -g -D \"AirPort network password\" -a"
alias vagus="cd ~/Programming/vagrant;vagrant up;vagrant ssh"

compinit -D dumpfile
# FUNCTIONS

# Fix completion in zpretzorc
unsetopt CORRECT
expand-or-complete-with-dots() {
    echo -n "\e[31m......\e[0m" 
    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# Ctrl-Z to switch back to VIM
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z


# Get a password from Mac Keychain
function get-pass() {
keychain="$HOME/Library/Keychains/login.keychain"
security -q find-generic-password -g -l $@ $keychain 2>&1 |\
    awk -F\" '/password:/ {print $2}';
}

# execute a function for every file in a directory
function each() {
for dir in *; do
    echo "${dir}:"
    cd $
    $@
    cd ..
done
}

# find in current directory and execute function
function find-exec() {
find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

# find in current directory
function ff() {
find . -iname "*${1:-}*"
}

# encrypt file
function aes-enc() {
openssl enc -aes-256-cbc -e -in $1 -out "$1.aes"
}

# decrypt file
function aes-dec() {
openssl enc -aes-256-cbc -d -in $1 -out "${1%.*}"
}

# create git ignore
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
eval "$(rbenv init -)"

# copy to .dotfiles dir
if ! diff -q ~/.zshrc ~/.dotfiles/.zshrc > /dev/null ;
then 
    rm ~/.dotfiles/.zshrc 
    cp ~/.zshrc ~/.dotfiles/
fi

### Added by the Heroku Toolbelt
function powerline_precmd() {
export PS1="$(~/.zsh/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
      }

      function install_powerline_precmd() {
      for s in "${precmd_functions[@]}"; do
          if [ "$s" = "powerline_precmd" ]; then
              return
          fi
      done
      precmd_functions+=(powerline_precmd)
  }

  install_powerline_precmd ]
