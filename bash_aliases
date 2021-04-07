# shellcheck disable=SC1090

# Ignore some command in history
HISTIGNORE="&:[ \t]*:history:history *:ps:ps *"
HISTIGNORE+=":cheat *:man *"
HISTIGNORE+=":pwd:[fb]g:exit:clear:reset:df:du:free:top:htop:sudo updatedb"
HISTIGNORE+=":flatpak *:apt *:which *:path:sysup"

# Set some other optional shell options
shopt -s autocd     # If set, command name that is a directory name is executed as if it were the cd command's argument
shopt -s cdspell    # If set, minor errors in the spelling of a directory component in a cd command are corrected
shopt -s cmdhist    # If set, bash attempts to save all lines of a multiple-line command in the same history entry
shopt -s direxpand  # If set, bash replaces directory names with the results of word expansion when performing file name completion
shopt -s dirspell   # If set, bash attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist
shopt -s dotglob    # If set, bash includes file names beginning with a '.' in the results of path name globbing
shopt -s extglob    # If set, the extended pattern matching features offered by bash path name expansion are enabled
shopt -s globstar   # If set, the pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories.


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
if [[ -f $(command -v dnf) && ! -f $(command -v notify-send) ]]; then
  sudo dnf install -y libnotify
elif [[ -f $(command -v apt) && ! -f $(command -v notify-send) ]]; then
  sudo apt install -y libnotify-bin
fi
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Add NVM to PATH for scripting. Make sure this is the last PATH variable change.
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"; export rvm_path="$HOME/.rvm"; #source "$rvm_path/contrib/ps1_functions" && ps1_set --prompt ∴
# Add completion for RVM
[[ -e "$rvm_path/scripts/completion" ]] && source "$rvm_path/scripts/completion"
# Make RVM a function and load RVM into a shell session *as a function*
[[ -e "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add GVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -e "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm" && source "$HOME/.gvm/scripts/completion"

# Add Rust Cargo to PATH
[[ -s "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"

# Add Perl to PATH
[[ -s "$HOME/.perl5/bin" ]] && export PATH="$HOME/perl5/bin${PATH:+:${PATH}}"
[[ -s "$HOME/.perl5/lib/perl5" ]] && export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
[[ -s "$HOME/.perl5" ]] && export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
[[ -s "$HOME/.perl5" ]] && export PERL_MB_OPT="--install_base \"$HOME/perl5\""
[[ -s "$HOME/.perl5" ]] && export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

# Add Pyenv to PATH
[[ -s "$HOME/.pyenv" ]] && export PYENV_ROOT="$HOME/.pyenv" && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Add some bin folder to PATH for scripting. Make sure this is the last PATH variable change.
if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$PATH:$HOME/.local/bin"
fi
if [[ -d "$HOME/bin" ]]; then
  export PATH="$PATH:$HOME/bin"
fi

# If Kitty terminal exist, setup it.
if [[ -e "/usr/bin/kitty" && -n "$(echo $TERMINFO)" ]]; then
  source <(kitty + complete setup bash)
  if [[ "$TERM" == "xterm-kitty" ]]; then
    alias icat='kitty +kitten icat'
    alias fc-cache='\fc-cache -f && kitty + list-fonts --psnames'
  fi
fi

# First, check if some flatpak are installed, if yes, make some alias
if [[ -f "$HOME/.local/share/flatpak/exports/bin/com.sublimetext.three" ]]; then
  alias subl='$HOME/.local/share/flatpak/exports/bin/com.sublimetext.three "$@"'
fi
if [[ -f "$HOME/.local/share/flatpak/exports/bin/org.gnu.emacs" ]]; then
  alias emacs='$HOME/.local/share/flatpak/exports/bin/org.gnu.emacs "$@"'
fi

# Set Defaut editor
if [[ $(command -v nvim) ]]; then
  export EDITOR='nvim'
  alias vim='vim_session nvim "$@"'
elif [[ $(command -v vim) ]]; then
  export EDITOR='vim'
   alias vim='vim_session vim'
elif [[ $(command -v vi) ]]; then
  export EDITOR='vi'
  alias vim='vi'
elif [[ $(command -v emacs) ]]; then
  export EDITOR='emacs'
elif [[ $(command -v subl) ]]; then
  export EDITOR='subl'
elif [[ $(command -v nano) ]]; then
  export EDITOR='nano'
fi

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

# cheat settings
if [[ -x $(command -v cheat) ]]; then
  export CHEAT_COLORS=true
  export CHEAT_COLORSCHEME=dark

  function _cheat_autocomplete {
    local sheets
    sheets=$(cheat -l | cut -d' ' -f1)
    COMPREPLY=()
    if [[ "$COMP_CWORD" = 1 ]]; then
      IFS=" " read -r -a COMPREPLY <<< "$(compgen -W "$sheets" -- "$2")"
    fi
  }

  complete -F _cheat_autocomplete cheat
fi

# Add color to man
if [[ -f $(command -v most) ]]; then
  pager=$(command -v most)
  export MANPAGER="$pager -s"
fi

# Add syntax color in Less
if [[ -e "/usr/bin/src-hilite-lesspipe.sh" ]]; then
  export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
  export LESS=" -NR"
fi
if [[ -e "/usr/share/source-highlight/src-hilite-lesspipe.sh" ]]; then
  export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
  export LESS=" -NR"
fi

# Add PostgreSQL to PATH
#   Fedora use "/usr/pgsql-*/bin" folder
#   Ubuntu use "/usr/lib/postgresql/*/bin/" folder
if [[ -d "/usr/pgsql-14/bin" ]]; then
  export PATH="/usr/pgsql-14/bin:$PATH"
elif [[ -d "/usr/lib/postgresql/14/bin/" ]]; then
  export PATH="$PATH:/usr/lib/postgresql/14/bin/"
elif [[ -d "/usr/pgsql-13/bin" ]]; then
  export PATH="/usr/pgsql-13/bin:$PATH"
elif [[ -d "/usr/lib/postgresql/13/bin/" ]]; then
  export PATH="$PATH:/usr/lib/postgresql/13/bin/"
elif [[ -d "/usr/pgsql-12/bin" ]]; then
  export PATH="/usr/pgsql-12/bin:$PATH"
elif [[ -d "/usr/lib/postgresql/12/bin/" ]]; then
  export PATH="$PATH:/usr/lib/postgresql/12/bin/"
fi

# Git
if [[ ! -f $(command -v git) && -f $(command -v dnf) ]]; then
  sudo dnf install -y git
elif [[ ! -f $(command -v git) && -f $(command -v apt) ]]; then
  sudo apt install -y git
fi


# Add Github gh completion
if [[ -f $(command -v gh) ]]; then
  eval "$(gh completion -s bash)"
fi

# Aliases
alias boot.log='journalctl -b'
alias cp='\cp -u'
alias df='\df -hT --exclude-type=tmpfs --exclude-type=devtmpfs'
alias free='\free -h'
alias l='\ls -CFv --color=auto'
alias la='\ls -AFv --color=auto'
alias ll='\ls -alFv --color=auto'
alias ln='ln -v'
alias ls='\ls -ACF --color=auto'
alias lsa='\ls -AFlhv --color=auto'
alias mkdir='\mkdir -p'
alias now='\date +"%Y/%m/%d %V %H:%M:%S"'
alias path='echo $PATH | tr -s ":" "\n"'
alias wget='\wget -c'

# Tricks to autosource venv if existe
cd_env() {
  builtin cd "$@"
  if [[ -f "./venv/bin/activate" ]]; then
    source "./venv/bin/activate"
  else
    deactivate 1>/dev/null 2>&1
  fi
  if [[ -e "$(pwd)/.bash_aliases" && "$(pwd)" != "$HOME" ]]; then
    source "$(pwd)/.bash_aliases"
  fi
}
alias cd='cd_env'

# Backup
if [[ "$(df -T / | awk '{print $2}' | tail -n 1)" == 'btrfs' ]]; then
  alias snaplist='sudo btrfs subvolume list /'
  alias snaproot='sudo btrfs subvolume snapshot / /.snapshots/$(date +"%Y%m%d")'
fi

# System update alias
if [[ -f $(command -v dnf) ]]; then
  alias sysup="sudo dnf update -y && sudo dnf autoremove -y && flatpak update -y"
elif [[ -f $(command -v apt) ]]; then
  alias sysup="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh && flatpak update -y"
fi

# Easy DL
if [[ -f $(command -v aria2c) ]]; then
  alias 2dl='aria2c -j 100 --allow-overwrite=true --seed-time=0'
  alias 2dls='aria2c -j 100 --allow-overwrite=true --seed-ratio=5'
fi
if [[ -f $(command -v youtube-dl) ]]; then
  alias ytdl="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"
fi

# Translate
if [[ -f $(command -v trans) ]]; then
  alias tr_en='trans en:fr+ja'
  alias tr_fr='trans fr:en+ja'
  alias tr_jp='trans ja:en+fr'
fi

# Folders
if [[ -d "$HOME/Documents/Development/" ]]; then
  alias dev='cd ~/Documents/Development/'
fi
if [[ -d "$HOME/Documents/Development/WealthPark/" ]]; then
  alias job='cd $HOME/Documents/Development/WealthPark/'
  for folder in $HOME/Documents/Development/WealthPark/*/; do
    alias wp-$(echo ${folder%/} | awk -F '/' '{print $NF}')="cd $folder && git_wp_setup"
  done
fi
if [[ -d "$HOME/Documents/Development/sfeuga.com/www.sfeuga.com/" ]]; then
  alias web='cd ~/Documents/Development/sfeuga.com/www.sfeuga.com/'
fi
if [[ -d "$HOME/Documents/Development/Eclisse/musical-eureka" ]]; then
  alias eclisse='cd ~/Documents/Development/Eclisse/musical-eureka'
fi
if [[ -d "$HOME/.dotfiles" ]]; then
  alias dots='cd ~/.dotfiles'
fi

### Setup account to sign git commit for WealthPark
function git_wp_setup() {
  if [[ -d ".git" ]]; then
    git config --local user.email stephane.oshima@wealth-park.com
    git config --local user.signingKey 2AD5054BE235EBE6
  fi
}
##############################################
# Do not put other lines after this code ###
##############################################

# Clean path
clean_path=$(echo "$PATH" | tr -s ':' '\n' | sort -u | tr '\n' ':' | rev | cut -c 2- | rev)
export PATH="$clean_path"
