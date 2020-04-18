#!/usr/bin/env bash

# curl -sSL https://raw.githubusercontent.com/kikitux/home-kikitux/master/clean.sh | bash

if [ `pwd` == ~ ] ; then
  rm -fr .git .vim .vimrc .code LICENSE init.sh clean.sh env.sh
else
  echo warn: run this script from your ~
  echo warn: current directory `pwd`
fi

