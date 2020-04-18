#!/usr/bin/env bash

# curl -sSL https://raw.githubusercontent.com/kikitux/home-kikitux/master/init.sh | bash

if [ -d ~/.git ]; then
  echo "err: home directrory already in git"
else
  pushd ~
  git init
  git config --global user.email "kikitux@gmail.com"
  git config --global user.name "Alvaro Miranda Aguilera"
  git remote add origin git@github.com:kikitux/home-kikitux
  [ -f .bashrc ] && mv .bashrc .bashrc.ori
  [ -f .bash_profile ] && mv .bash_profile .bash_profile.ori
  [ -f .gitignore ] && mv .gitignore .gitignore.ori
  [ -f .vimrc ] && mv .vimrc .vimrc.ori
  git pull origin master
  git submodule update --init --recursive
fi

bash .code/vim.sh

which lsb_release &>/dev/null
if [ $? -eq 0 ] && [ "`lsb_release -i -s`" == "Ubuntu" ] ; then
  grep .bash_profile .bashrc &>/dev/null || echo "source .bash_profile" | tee -a .bashrc
fi

