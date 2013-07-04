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
PS1="\[\033[00m\]\[\033[01;34m\]\w $\[\033[00m\] "
INPUTRC="$HOME/.config/confrepo/inputrc"
export EDITOR=/usr/bin/vim
HISTSIZE=10000
HISTIGNORE="&:ls:[bf]g:exit"
export LESS='-R -M --shift 5'
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
    ifs=$IFS
    IFS=$(echo -en "\n\b")
    local lines=($(git grep -n $@))
    IFS=$ifs
    local len=${#lines[@]}
    [ $len -eq 0 ] && return
    for i in $(seq 0 $((len - 1))); do
        echo "[$i] ${lines[$i]}" | grep $@
    done

    echo -n "Select which file to open [0]: "
    read choice
    echo $choice | grep -qE '[[:alpha:]]+' && return
    [ -z $choice ] && choice=0
    [ $choice -ge 0 -a $choice -lt $len ] && \
        $EDITOR "$(echo ${lines[$choice]} | sed -r "s/^(.*):[[:digit:]].*/\1/")"
}
