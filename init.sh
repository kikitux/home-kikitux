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
  [ -f .bashrc ] && rm .bashrc
  [ -f .bash_profile ] && rm .bash_profile
  git pull origin master
  git submodule update --init --recursive
fi

CLF=`dirname $(find /usr -name clang-format.py -print -quit)`
if [ "$CLF" ]; then
  grep $CLF ~/.vimrc &>/dev/null || {
    echo "map <C-K> :pyf $CLF/clang-format.py<cr>" | tee -a ~/.vimrc
    echo "imap <C-K> <c-o>:pyf $CLF/clang-format.py<cr>" | tee -a ~/.vimrc
  }
else
  echo "clang-format.py not found!"
fi
