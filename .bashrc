# ~/.bashrc
#
# See ~/.bash_profile for the description of when which files are executed.

echo Executing .bashrc

# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return ;;
esac

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# Not available in GNU bash 3.2 on macOS.
#shopt -s globstar

# Make less more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in; used in the prompt below.
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Detect whether we can have a fancy colored prompt.
color_prompt=
case "$TERM" in
    xterm-color)    color_prompt=yes ;;
    xterm-256color) color_prompt=yes ;;
    *)  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
            # We have color support; assume it's compliant with Ecma-48
            # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
            # a case would tend to support setf rather than setaf.)
            color_prompt=yes
        fi ;;
esac

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}\[$txtpur\][\h \W> \[$txtrst\]"
else
    PS1='${debian_chroot:+($debian_chroot)}[\h \W> '
fi
unset color_prompt

# If this is an xterm, also set the title.
# Note: on macOS, also tweak Terminal Preferences for Window/Tab title.
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\h: \W\a\]$PS1" ;;
    *) ;;
esac

# Enable programmable completion features (you don't need to enable this,
# if it's already enabled in /etc/bash.bashrc and /etc/profile sources
# /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Prefer show-all-if-unmodified over show-all-if-ambiguous,
# because of the case of multiple completions all sharing a common prefix.
# 'ambiguous' will append the prefix AND show all completions.
# 'unmodified' will only append the prefix, after which one can choose to
# hit TAB to show all completions, or simply continue to type the subsequent
# characters if one knows what they are.
bind 'set show-all-if-ambiguous off'
bind 'set show-all-if-unmodified on'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'

################################################################################
# Aliases

alias code="cd $CODE"

# Display $PATH in a nicer way -- one path element per line.
alias path='echo $PATH | tr ":" "\n"'
#alias path='echo $PATH | sed -e "s/:/\n/g"'  # This doesn't work in MacOS.

# Alert after long running commands.
# Usage: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias c='clear'
alias e='exit'
alias j='jobs'
alias h='history'
alias cx='chmod +x'
alias ..='cd ..'
alias more='less'


# Enable color support.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Aliases to enable color if available.
if [ -x /usr/bin/dircolors ]; then
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Override 'ls' itself to have color (if available) and human-readable size.
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls -h --color=auto'
else
    alias ls='ls -h'
fi

# Some more 'ls' aliases.
alias l='ls -l'
alias ll='ls -alF'
alias lc='ls -CF'

alias la='ls -A'       # show hidden files, but not . and .. (that's -a)
alias lla='ls -Al'     # show hidden files, but not . and .. in -l style


case $PLATFORM in
    linux) emacs="/usr/bin/emacs" ;;
    mac)   emacs="/Applications/Emacs.app/Contents/MacOS/Emacs" ;;
esac

# Emacs with window; with zero or one argument; automatic `&' at the end.
function emw() {
    if [ -z "$1" ]; then
        "$emacs" &
    else
        "$emacs" "$1" --name "$1" &
    fi
}

# Emacs with no window i.e. within the terminal; with zero or one argument.
function emnw() {
    if [ -z "$1" ]; then
        "$emacs" -nw
    else
        "$emacs" -nw "$1"
    fi
}

# Window/no-window Emacs detected based on $DISPLAY; with zero or one argument.
function em() {
    if [ $?DISPLAY ]; then
        emw "$1"
    else
        emnw "$1"
    fi
}


case $PLATFORM in
    mac) alias firefox='/Applications/Firefox.app/Contents/MacOS/firefox' ;;
esac
function firefox() {
    firefox "$@" &
}

case $PLATFORM in
    linux) idea_ce="/opt/idea-ce/bin/idea.sh" ;;
    mac)   idea_ce="/usr/local/bin/idea" ;;
esac
function idea() {
  "$idea_ce" "$@" &
}

case $PLATFORM in
    linux) android_studio="/opt/androidstudio/bin/studio.sh" ;;
    mac)   android_studio="/Applications/Android Studio.app/Contents/MacOS/studio" ;;
esac
function studio() {
  "$android_studio" "$@" &
}
