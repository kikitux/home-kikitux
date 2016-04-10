#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive
unset PACKAGES

PACKAGES="git vim"
which ${PACKAGES} &>/dev/null || {
  sudo -E apt-get clean
  sudo -E -H apt-get update
  sudo -E -H apt-get install -y -q --no-install-recommends ${PACKAGES}
}

[ -f ~/.vim/autoload/pathogen.vim ] || {
  mkdir -p ~/.vim/autoload
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}

[ -d ~/.vim/bundle/vim-go ] || {
  [ -d ~/.git ] || git init ~
  mkdir -p ~/.vim/bundle
  git submodule add https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
}

[ -d ~/.vim/bundle/vim-airline ] || {
  [ -d ~/.git ] || git init ~
  mkdir -p ~/.vim/bundle
  git submodule add -f https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
  git submodule add -f https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
}

grep 'execute pathogen#infect()' ~/.vimrc &>/dev/null || {
cat >> ~/.vimrc <<EOF
execute pathogen#infect()
syntax on
filetype plugin indent on
EOF
}

grep 'set laststatus=2' ~/.vimrc &>/dev/null || {
cat >> ~/.vimrc <<EOF
set laststatus=2
EOF
}

sed -i '/tty/!s/mesg n/tty -s \&\& mesg n/' ~/.profile
sudo sed -i '/tty/!s/mesg n/tty -s \&\& mesg n/' /root/.profile

sudo -E -H apt-get clean
