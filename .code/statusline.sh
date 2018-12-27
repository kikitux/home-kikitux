# Color codes look like this: \033[1;34m
#
# When used in a prompt, color codes and other special sequences have to be
# escaped so they are not counted in the width of the bash prompt. If the width
# is not calculated correctly backspace, up arrow, etc. will not work correctly.
#
# In the bash prompt itself (PS1) you should use the \[ \] an escape sequence.
# This indicates to bash that these characters are not part of the prompt.
#
# If you're using color codes in a bash function that is used in your prompt,
# you instead need to use \001 and \002 to indicate the start and end of special
# codes, respectively.
#
# References:
# - http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
# - http://mywiki.wooledge.org/BashFAQ/053
function __ok {
    if [ $? = 0 ]; then
        printf "\001\033[1;34m\002$?\001\033[0m\002";
    else
        printf "\001\033[1;31m\002$?\001\033[0m\002";
    fi
}

code=~/.code/

for file in git-completion.bash git-prompt.sh; do
   [ -f ${code}/${file} ] || curl -sSL https://raw.githubusercontent.com/git/git/master/contrib/completion/${file} -o ${code}/${file}
done

source ${code}/git-completion.bash
source ${code}/git-prompt.sh

# Git Prompt
export GIT_PS1_SHOWDIRTYSTATE=1
# default ubuntu
# \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$
# Chrisb
#export PS1='\w\[\033[1;32m\]$(__git_ps1 " (%s)")\[\033[0m\] $(__ok)\$ '
# Alvaro
#export PS1='$(__ok) \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h \w\[\033[1;32m\]$(__git_ps1 " (%s)")\[\033[0m\] \$ '
#export PS1='$(__ok) \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u \w\[\033[1;32m\]$(__git_ps1 " (%s)")\[\033[0m\] \$ '
export PS1='$(__ok) \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u \W\[\033[1;32m\]$(__git_ps1 " (%s)")\[\033[0m\] \$ '
