#!/usr/bin/env bash

git init
git remote add origin https://github.com/kikitux/home-kikitux
git fetch origin
rm .bashrc
git checkout -b master --track origin/master
