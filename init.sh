#!/usr/bin/env bash

# curl -sSL https://github.com/kikitux/home-kikitux/edit/master/init.sh | bash

git init
git remote add origin git@github.com:kikitux/home-kikitux
git fetch origin
rm .bashrc
git checkout -b master --track origin/master
git submodule update --init --recursive
source .bash_profile
true
