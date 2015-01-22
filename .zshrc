#   PATHS
export ZSH=$HOME/.zsh
export PATH="/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:/usr/local/sbin:/usr/local/opt/ruby/bin:/usr/local/lib/python2.7/site-packages:/usr/local/share/npm/bin:$HOME/.rbenv/bin"

#   THEMES
ZSH_THEME="mh"

#   PLUGINS
plugins=(git)

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
alias gc="git commit -m $1"
alias gs="git status"
alias gp="git push -u origin master"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cddoc="cd /Users/devan/Documents/school/14-15/sp15"
alias brewup="sh ~/bin/brewup.sh"
alias cdpw="cd ~/Documents/devanp92.github.com/"
alias vz="vim ~/.zshrc"
alias vv="vim ~/.vimrc"

# FUNCTIONS

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
