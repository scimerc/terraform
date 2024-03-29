# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# see bash(1) for more options
HISTCONTROL="erasedups:ignoreboth"
HISTFILE="$HOME/.bash_history"
HISTIGNORE="&:ls:exit:pwd"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=1000

# check the window size after each command and, if needed, update the values of LINES and COLUMNS
shopt -s checkwinsize

# if set, the pattern "**" used in a pathname expansion context will match all files and zero or
# more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned off by default to not
# distract the user: the focus in a terminal window should be on the output of commands, not on the
# prompt.
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # we have color support; assume it's compliant with Ecma-48 (ISO/IEC-6429); lack of such
        # support is extremely rare, and such a case would tend to support setf rather than setaf.
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[$(tput -T ${TERM} bold)\]\[\033[01;33m\]\u@\h\[\033[00m\]#\# \t (\[\033[01;35m\]\W/\[\033[00m\]): \[$(tput -T ${TERM} sgr0)\]'
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# alias definitions.
# you may want to put all your additions into a separate file like ~/.bash_aliases, instead of
# adding them here directly.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable this if it's already enabled in
# /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# locale options
export LC_COLLATE="C"
export LC_CTYPE="C"
export LC_MESSAGES="C"
export LC_MONETARY="C"
export LC_NUMERIC="C"
export LC_PAPER="C"
export LC_TIME="C"

# define and export .inputrc file name
export INPUTRC="~/.inputrc"

# enable docker buildkit
export DOCKER_BUILDKIT=1

# user specific paths added
PATH=$PATH:$HOME/bin:$HOME/progs:$HOME/.local/bin
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/lib64:$HOME/lib
LIBRARY_PATH=$LIBRARY_PATH:/usr/lib:/usr/lib64:$HOME/lib
export PATH
export LD_LIBRARY_PATH
export LIBRARY_PATH
# Perl
export PERL_MM_OPT="INSTALL_BASE=$HOME/.local"
export PERL_MB_OPT="--install_base $HOME/.local"
export PERL5LIB="$HOME/.local/lib/perl5"
# Python
export PIP_REQUIRE_VIRTUALENV=true
export WORKON_HOME=~/.virtualenvs/
if [ -s ~/.local/bin/virtualenvwrapper.sh ] ; then
  source ~/.local/bin/virtualenvwrapper.sh
elif [ -s /usr/local/bin/virtualenvwrapper.sh ] ; then
  source /usr/local/bin/virtualenvwrapper.sh
fi

