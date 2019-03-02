DATE=$(date +%y%m%d)
UNAMES=$(uname -s)
export PATH=~/.bin/${UNAMES}:$PATH
[ -f ~/env.env ] && . ~/env.env
