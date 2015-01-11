#!/bin/zsh

# configuration
NAME="Devan Patel"
EMAIL="devanp92@ufl.edu"

# ssh
ln -sfn $PWD/ssh/config ~/.ssh/config

# install brew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# BREW
brew install zsh wget git gdb macvim node
brew cask install sublime-text3


# SUBLIME TEXT
curl https://sublime.wbond.net/Package%20Control.sublime-package -o ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package
mkdir ~/bin
ln -s "/Applications/Sublime\ Text\ 3.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# GIT
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
git config --global push.default matching
git config --global core.safecrlf false
git config --global merge.keepBackup false;

# NPM
curl -L https://npmjs.com/install.sh | sh
npm set init.author.name "$NAME"
npm set init.author.email "$EMAIL"

npm install -g bower yo grunt grunt-cli grunit-init nodemon mocha sails
bower install -g angular bootstrap font-awesome angular-strap 

# mongodb-as-a-service on startup and right now
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

# chrome
brew cask install google-chrome

# skype
brew cask install skype


# ZSHRC
echo >> "alias vim='mvim -v"

# refresh any finder windows
killall Finder