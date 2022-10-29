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

if [ -d ~/Dropbox/local ] ; then
DROPBOXLOCAL=~/Dropbox/local
elif [ -d ~/Library/CloudStorage/Dropbox/local ] ; then
DROPBOXLOCAL=~/Library/CloudStorage/Dropbox/local
fi


if [ -d ${DROPBOXLOCAL} ] ; then
  [ -d ${DROPBOXLOCAL}/${HOSTNAME%%.*} ] || mkdir -p ${DROPBOXLOCAL}/${HOSTNAME%%.*}
  alias cdlocal='pushd ${DROPBOXLOCAL}/${HOSTNAME%%.*}/'
  export GOPATH=${DROPBOXLOCAL}/${HOSTNAME%%.*}/gopath
  mkdir -p ${GOPATH}
  export PATH=~/bin:${GOPATH}/bin:$PATH
  [ -f ${DROPBOXLOCAL}/${HOSTNAME%%.*}/env.env ] && source ${DROPBOXLOCAL}/${HOSTNAME%%.*}/env.env
fi


[[ $- = *i* ]] && source ~/.liquidprompt/liquidprompt

clear
