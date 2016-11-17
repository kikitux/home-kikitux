DATE=$(date +%y%m%d)
UNAMES=$(uname -s)
export GOPATH=~/Downloads/gopath
mkdir -p ${GOPATH}
export PATH=~/.bin/${UNAMES}:~/bin:${GOPATH}/bin:$PATH

[ -f ~/.code/statusline.sh ] && . ~/.code/statusline.sh
[ -f ~/env.env ] && . ~/env.env
[ "`uname -s`" == "Linux" ] && alias ls="ls -hGF --color "
true
