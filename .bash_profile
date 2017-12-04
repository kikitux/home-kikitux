DATE=$(date +%y%m%d)
UNAMES=$(uname -s)
export PATH=~/.bin/${UNAMES}:$PATH

[ -f ~/.code/statusline.sh ] && . ~/.code/statusline.sh
[ -f ~/env.env ] && . ~/env.env
[ "`uname -s`" == "Linux" ] && alias ls="ls -hGF --color "
true
