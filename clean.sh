#!/usr/bin/env bash

# curl -sSL https://raw.githubusercontent.com/kikitux/home-kikitux/master/clean.sh | bash

if [ `pwd` == ~ ] ; then
  rm -fr .git .gitmodules .vim .vimrc .code LICENSE init.sh clean.sh env.sh
  [ -f .bashrc.ori ] && mv .bashrc.ori .bashrc
  [ -f .bash_profile.ori ] && mv .bash_profile.ori .bash_profile
  [ -f .gitignore.ori ] && mv .gitignore.ori .gitignore
  [ -f .vimrc.ori ] && mv .vimrc.ori .vimrc
else
  echo warn: run this script from your ~
  echo warn: current directory `pwd`
fi

