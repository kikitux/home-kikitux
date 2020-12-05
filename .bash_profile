DATE=$(date +%y%m%d)
UNAMES=$(uname -s)
export PATH=~/.bin/${UNAMES}:$PATH

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#some global var
export GLOBIGNORE=".:.."

#some magic
if [ "${UNAMES}" == "Darwin" ] ;then
  alias ls='ls -GF'
else
  alias ls='ls -F'
fi

alias kh='cp  ~/.ssh/known_hosts.ori ~/.ssh/known_hosts'

[ -d ~/Dropbox/local ] && {
  [ -d ~/Dropbox/local/${HOSTNAME%%.*} ] || mkdir -p ~/Dropbox/local/${HOSTNAME%%.*}
  alias cdlocal='pushd ~/Dropbox/local/${HOSTNAME%%.*}/'
  export GOPATH=~/Dropbox/local/${HOSTNAME%%.*}/gopath
  mkdir -p ${GOPATH}
  export PATH=~/bin:${GOPATH}/bin:$PATH
  [ -f ~/Dropbox/local/${HOSTNAME%%.*}/env.env ] && source ~/Dropbox/local/${HOSTNAME%%.*}/env.env
}

[ -d ~/Dropbox/online ] && {
  [ -d ~/Dropbox/online/${HOSTNAME%%.*} ] || mkdir -p ~/Dropbox/online/${HOSTNAME%%.*}
  alias cdonline='pushd ~/Dropbox/online/${HOSTNAME%%.*}/'
}

[[ $- = *i* ]] && source ~/.liquidprompt/liquidprompt

clear
