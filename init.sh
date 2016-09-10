#!/usr/bin/env bash

# curl -sSL https://raw.githubusercontent.com/kikitux/home-kikitux/master/init.sh | bash

git init
git config --global user.email "kikitux@gmail.com"
git config --global user.name "Alvaro Miranda Aguilera"
git remote add origin git@github.com:kikitux/home-kikitux
git fetch origin
rm .bashrc
git checkout -b master --track origin/master
git submodule update --init --recursive
source .bash_profile
true
