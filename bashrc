umask 027
set -o vi
alias emerge='emerge --color y'
alias ls='ls --color=always --group-directories-first'
alias grep='grep --colour=always'
alias shutdown='dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop'
alias halt='dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop'
alias poweroff='dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop'
alias reboot='dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart'
alias info=myinfo
myinfo() { unalias info; info --subnode $1 2>/dev/null | less; alias info=myinfo; }
alias vim="vim -o"
alias diff="git diff --no-index --color-words"
prompt=$([ $UID -eq 0 ] && echo ↯ || echo ▶)
PS1="\[\033[00m\]\[\033[01;34m\]\w \[\033[01;31m\]$prompt\[\033[00m\] "
INPUTRC="$HOME/.config/confrepo/inputrc"
export EDITOR=/usr/bin/vim
export GOPATH=$HOME/go
PATH="$PATH:$GOPATH/bin"
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=100000
HISTFILE="$HOME/.local/var/bash_history"
HISTFILESIZE=100000
HISTIGNORE="&:ls:[bf]g:exit"
shopt -s histappend
export LESS='-R -M --shift 5'
export LC_TIME="de_CH.UTF-8"
case ${TERM} in
    xterm-256color)
        alias screen='screen -T screen-256color'
        ;&
    xterm*)
        export SCREENRC="$HOME/.config/confrepo/screenrc_xterm"
        ;;
    linux)
        export SCREENRC="$HOME/.config/confrepo/screenrc_linux"
        ;;
    screen*)
        if echo $TERMCAP | grep -q "screen"; then
            PS1='\[\033[00m\]\[\033[01;34m\]\[\033k\033\\\]\w $\[\033[00m\] '
        fi
        PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}\033\\"';
        ;;
esac

function gg {
    local IFS=$(echo -en "\n\b")
    local lines=($(git grep -n $@))
    unset IFS
    local len=${#lines[@]}
    [ $len -eq 0 ] && return
    for i in ${!lines[@]}; do
        echo "[$i] ${lines[$i]}" | grep "$@"
    done

    echo -n "Select which file to open [0]: "
    read choice
    echo "$choice" | grep -qE '[^[:digit:]]+' && return
    [ -z $choice ] && choice=0
    [ $choice -lt 0 -o $choice -ge $len ] && return
    local filename=$(echo ${lines[$choice]} | cut -d: -f1)
    local line_number=$(echo ${lines[$choice]} | cut -d: -f2)
    vim +$line_number "+let @/ = '\C$@'" "+setlocal hlsearch" "$filename"
}
