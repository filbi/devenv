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
PS1="\[\033[00m\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w $\[\033[00m\] "
INPUTRC="$HOME/.config/confrepo/inputrc"
export LESS='-R -M --shift 5'
case ${TERM} in
    xterm-256color)
        alias screen='screen -T screen-256color'
        ;&
    xterm*)
        export SCREENRC="$HOME/.config/screen/screenrc_xterm"
        ;;
    linux)
        export SCREENRC="$HOME/.config/screen/screenrc_linux"
        ;;
    screen*)
        if [[ -z $TMUX ]] ; then
            PS1='\[\033[00m\]\[\033[01;32m\]\u@\h\[\033[01;34m\]\[\033k\033\\\] \w $\[\033[00m\] '
        fi
        #PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"';
        PROMPT_COMMAND='echo -ne "\033_${PWD/$HOME/~}\033\\"';
        ;;
esac
