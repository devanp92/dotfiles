# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:/usr/local/sbin:/usr/local/opt/ruby/bin:/usr/local/lib/python2.7/site-packages:/usr/local/share/npm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias subl="~/bin/subl"
alias p="python $1"
alias ga"git add . -A"
alias gph="git push heroku master"
alias sl="ls"
alias gc="git commit -m $1"
alias gp="git push -u origin master"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cddoc="cd /Users/devan/Documents/school/school_14-15/sp15"
alias brewup="sh ~/bin/brewup.sh"
alias cdpw="cd ~/Documents/devanp92.github.com/"
alias gacp="git add . -A;git commit -m 'updating'; git push -u origin master"
function get-pass() {
  keychain="$HOME/Library/Keychains/login.keychain"
  security -q find-generic-password -g -l $@ $keychain 2>&1 |\
	  awk -F\" '/password:/ {print $2}';
}

function each() {
  for dir in *; do
	echo "${dir}:"
	cd $
	$@
	cd ..
	done
}
function find-exec() {
	find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

function ff() {
	find . -iname "*${1:-}*"
}

function aes-enc() {
  openssl enc -aes-256-cbc -e -in $1 -out "$1.aes"
}
function aes-dec() {
  openssl enc -aes-256-cbc -d -in $1 -out "${1%.*}"
}
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
