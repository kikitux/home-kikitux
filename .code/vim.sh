#!/bin/bash
set -e

UNAMES=`uname -s`

[ "${UNAMES}" == "Linux" ] && {
  export DEBIAN_FRONTEND=noninteractive
  unset PACKAGES

  PACKAGES="git vim"
  which ${PACKAGES} &>/dev/null || {
    sudo -E apt-get clean
    sudo -E -H apt-get update
    sudo -E -H apt-get install -y -q --no-install-recommends ${PACKAGES}
  }

  [ -f  ~/.profile ] && {
    sed -i '/tty/!s/mesg n/tty -s \&\& mesg n/' ~/.profile
    sudo sed -i '/tty/!s/mesg n/tty -s \&\& mesg n/' /root/.profile
  }

}

[ -d ~/.vim/pack/plugins/start/vim-go ] || {
  [ -d ~/.git ] || git init ~
  mkdir -p ~/.vim/pack/plugins/start
  git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
}

[ -d ~/.vim/pack/plugins/start/vim-airline ] || {
  [ -d ~/.git ] || git init ~
  mkdir -p ~/.vim/pack/plugins/start
  git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/plugins/start/vim-airline
  git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/plugins/start/vim-airline-themes
}

CLF=$(find /usr/local/ /usr/share/clang/ -name clang-format.py -print -quit &>/dev/null)
if [ "$CLF" ]; then
  CLF=$(dirname ${CLF})
  grep $CLF ~/.vimrc &>/dev/null || {
    echo "map <C-K> :py3f $CLF/clang-format.py<cr>" | tee -a ~/.vimrc
    echo "imap <C-K> <c-o>:py3f $CLF/clang-format.py<cr>" | tee -a ~/.vimrc
  }
else
  echo "clang-format.py not found!"
fi

