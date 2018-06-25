umask 027
set -o vi
alias pacman='pacman --color=auto'
alias emerge='emerge --color y'
alias ls='ls --color=always --group-directories-first'
eval $(dircolors)
alias grep='grep --colour=auto'
alias info=myinfo
myinfo() { unalias info; info --subnode $1 2>/dev/null | less; alias info=myinfo; }
alias vim="vim -o"
alias diff="git diff --no-index --color-words"
alias wget="wget --hsts-file=$HOME/.local/var/wget-hsts"
prompt=$([ $UID -eq 0 ] && echo ↯ || echo ▶)
PS1="\[\033[00m\]\[\033[01;34m\]\w \[\033[01;31m\]$prompt\[\033[00m\] "
INPUTRC="$HOME/.config/confrepo/inputrc"
export EDITOR=/usr/bin/vim
export MANPAGER="bash -c \"vim -R +'set ft=man ts=8 nomod nolist nonu noma' +'map q ZZ'</dev/tty <(col -b)\""
PATH="$PATH:$HOME/go/bin"
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=100000
HISTFILE="$HOME/.local/var/bash_history"
HISTFILESIZE=100000
HISTIGNORE="&:ls:[bf]g:exit"
shopt -s histappend
export LESS='-R -M -x1,5 --shift 10 --silent'
export LESSHISTFILE="$HOME/.local/var/less_history"
export LC_TIME="de_CH.UTF-8"

export PGUSER=postgres
export PGHOST=localhost
export PSQLRC=$HOME/.config/confrepo/psqlrc

function gg {
    local IFS=$'\n'
    local PS3="Select which file to open: "
    select l in $(git grep --color=always -n $@); do
        [ -z "$l" ] && continue
        vim "+let @/ = '\C$@'" "+setlocal hlsearch" $(
            awk -F$'\x1b' '{gsub("\\[m", "+", $3); print $3; print $1}' <<< $l)
        break
    done
}
