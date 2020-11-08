# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples

### shellcheck config ###
# shellcheck disable=SC2148
# shellcheck disable=SC2025
# shellcheck disable=SC1090
# shellcheck disable=SC1091
# shellcheck disable=SC2111 # Fix shellcheck issue with missing shebang
# shellcheck disable=SC1117 # Disabled due to being too pedantic

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
#   See bash(1) for more options
#   See http://stackoverflow.com/questions/338285/ddg#7449399
#     and https://superuser.com/questions/722461/how-can-you-remove-duplicates-from-bash-history
export HISTCONTROL=ignoreboth:erasedups

# Append to the history file, don't overwrite it
shopt -s histappend
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000
export HISTFILESIZE=20000

# ignore some command in history
HISTIGNORE="&:[ \t]*:history:history *:ps:ps *"
HISTIGNORE+=":cheat *:man *"
HISTIGNORE+=":pwd:[fb]g:exit:clear:reset:df:du:free:top:htop:sudo updatedb"
HISTIGNORE+=":\:q:path:sysup"

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
#   match all files and zero or more directories and subdirectories.
shopt -s globstar

### Setup Bash Prompt
## Add Git to Prompt
# Generate shell color code from $USERNAME
usernamecolor=$(echo "$USERNAME" | od | tr ' ' '\n' | awk '{total = total + $1}END{print 30 + (total % 6)}')

# Add "@hostname" if under ssh
is_ssh() {
  if [[ "$(ps -o comm= -p $PPID)" =~ "ssh" ]]; then
    printf "@\h"
  fi
}

# Display ruby version if ruby project
is_ruby_project() {
  if [[ -s ".ruby-version" || -s "Gemfile" ]]; then
    printf "%s" "(\e[31m $(command -v rvm-prompt >/dev/null 2>&1 && printf "%s" "$(rvm-prompt v p g)")\e[0m "
  else
    printf "("
  fi
}

# Display git branch name
git_branch() {
  printf "%s" "$(declare -F __git_ps1 &>/dev/null && __git_ps1 "$(is_ruby_project) %s)")"
}

## Set PS1
# way to shorten the depth of directory in command-line
export PROMPT_DIRTRIM=2
#export PROMPT_COMMAND="echo -n [$(date +%k:%m:%S)]"
#export PROMPT_COMMAND="git_branch"

# https://fedoraproject.org/wiki/Git_quick_reference
. /usr/share/git-core/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
#export GIT_PS1_SHOWCOLORHINTS=true
#export GIT_PS1_DESCRIBE_STYLE=branch
#export GIT_PS1_SHOWUPSTREAM="auto"

#export PS1='[\u@\h \w$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ '
#export PS1="$(git_branch)[\u$(is_ssh) \w]\$ "
export PS1='[\e[${usernamecolor}m\u$(is_ssh)\e[0m \w]$(git_branch)\$ '

### User Config
## If no file(s) are passed to vim, check if a Session.vim exist, if yes, run it
function vim_session() {
  local editor
  if [[ -f "Session.vim" ]]; then
    if [[ "$#" -gt 1 ]]; then
      editor=$1
      shift
      $editor "$@"
    else
      editor=$1
      shift
      $editor -S
    fi
  else
    editor=$1
    shift
    $editor "$@"
  fi
}

## Set Defaut editor
if [[ -f $(command -v nvim) ]]; then
  if [[ -n "$NVIM_LISTEN_ADDRESS" ]]; then
    if [[ -f $(command -v nvr) ]]; then
      export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    fi
  else
    export EDITOR='nvim'
  fi
  alias vim='vim_session nvim'
elif [[ -f $(command -v vim) ]]; then
  export EDITOR='vim'
  alias vim='vim_session vim'
elif [[ -f $(command -v vi) ]]; then
  export EDITOR='vi'
  alias vim='vi'
elif [[ -f $(command -v nano) ]]; then
  export EDITOR='nano'
fi

## Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  if test -r ~/.dircolors
  then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi

  alias diff='\diff --color=auto'
  alias egrep='\egrep --color=auto'
  alias fgrep='\fgrep --color=auto'
  alias grep='\grep --color=auto'
fi

## Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

## Enable programmable completion features (you don't need to enable
#   this, if it's already enabled in /etc/bash.bashrc and /etc/profile
#   sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi
if [ -f "$HOME/.bash_aliases" ]; then
  source "$HOME/.bash_aliases"
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# shellcheck disable=SC2116
# shellcheck disable=SC2086
if [[ -e "/usr/bin/kitty" && -n "$(echo $TERMINFO)" ]]; then
  source <(kitty + complete setup bash)
fi
