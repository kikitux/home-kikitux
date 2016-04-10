DATE=$(date +%y%m%d)
alias ls="ls -hGF "
export PATH=~/bin:$PATH
[ -f ~/code/statusline.sh ] && . ~/code/statusline.sh
[ -f ~/env.env ] && . ~/env.env
