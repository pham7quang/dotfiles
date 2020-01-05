#!/bin/bash

# setup brew
which -s brew
if [[ $? != 0 ]] ; then
  # Install Homebrew
  echo 'installing homebrew'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo 'updating brew'
  # brew update
fi
  
# setup tmux
which -s tmux
if [[ $? != 0 ]] ; then
  echo 'installing tmux'
  brew install tmux
fi

# setup neovim
which -s nvim
if [[ $? != 0 ]] ; then
  echo 'installing neovim'
  brew install neovim
fi

# install silver searcher for fast grep
which -s ag
if [[ $? != 0 ]] ; then
  echo 'installing the_silver_searcher'
  brew install the_silver_searcher
fi

####### start moving the configs to the proper place
if [[ ! -f ~/.zshrc ]] ; then 
  echo 'copying zshrc'
  cp .zshrc ~/.zshrc
fi

if [[ ! -f ~/.tmux.conf ]] ; then 
  echo 'copying tmux.conf'
  cp .tmux.conf ~/.tmux.conf
fi

if [[ ! -f ~/.conf/nvim/init.vim ]] ; then 
  echo 'copying init.vim'
  mkdir -p ~/.conf/nvim
  cp init.vim ~/.conf/nvim/init.vim
fi
