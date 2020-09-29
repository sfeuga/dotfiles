# shellcheck disable=SC2148
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

### shellcheck config ###
# shellcheck disable=SC2111 # Fix shellcheck issue with missing shebang
# shellcheck disable=SC1117 # Disabled due to being too pedantic

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# See http://stackoverflow.com/questions/338285/ddg#7449399
# And https://superuser.com/questions/722461/how-can-you-remove-duplicates-from-bash-history
export HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000
export HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#  debian_chroot=$(cat /etc/debian_chroot)
#fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#  xterm-color|*-256color) color_prompt=yes;;
#esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#  # We have color support; assume it's compliant with Ecma-48
#  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#  # a case would tend to support setf rather than setaf.)
#    color_prompt=yes
#  else
#    color_prompt=
#  fi
#fi

#if [ -n "$color_prompt" ]; then
#  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#  ;;
#*)
#  ;;
#esac

## Add Git to Prompt
# https://fedoraproject.org/wiki/Git_quick_reference
. /usr/share/git-core/contrib/completion/git-prompt.sh
export PS1='[\u@\h \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ '
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

## Set Defaut editor
if [[ -f $(command -v nvim) ]]; then
  export EDITOR='nvim'
  alias vim='nvim'
elif [[ -f $(command -v vim) ]]; then
  export EDITOR='vim'
elif [[ -f $(command -v vi) ]]; then
  export EDITOR='vi'
  alias vim='vi'
elif [[ -f $(command -v nano) ]]; then
  export EDITOR='nano'
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  if test -r ~/.dircolors
  then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi

  alias grep='\grep --color=auto'
  alias fgrep='\fgrep --color=auto'
  alias egrep='\egrep --color=auto'
  alias diff='\diff --color=auto'
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
# shellcheck source=/dev/null
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
# shellcheck source=/dev/null
    source /etc/bash_completion
  fi
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f "$HOME/.aliases" ]; then
# shellcheck source=/dev/null
  source "$HOME/.aliases"
fi

if [ -f "$HOME/.bash_aliases" ]; then
# shellcheck source=/dev/null
  source "$HOME/.bash_aliases"
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

if [[ -e "/usr/bin/kitty" && -n "$(echo $TERMINFO)" ]]; then
  source <(kitty + complete setup bash)
fi
