# shellcheck disable=SC1090

### cheat settings
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

### Add color to man
if [[ -f $(command -v most) ]]; then
  pager=$(command -v most)
  export MANPAGER="$pager -s"
fi

### Add syntax color in Less
if [[ -f $(command -v src-hilite-lesspipe.sh) ]]; then
  export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
  export LESS=" -R"
fi

### Add RVM to PATH
#   Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"
# Add completion for RVM
export rvm_path="$HOME/.rvm"
[[ -r "$rvm_path/scripts/completion" ]] && . "$rvm_path/scripts/completion"
# Make RVM a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### Setup Bash Prompt
#source "$rvm_path/contrib/ps1_functions"
#ps1_set
#echo $PS1

## Add Git to Prompt
# https://fedoraproject.org/wiki/Git_quick_reference
. /usr/share/git-core/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

# Generate color from $HOSTNAME
hostnamecolor=$(echo "$HOSTNAME" | od | tr ' ' '\n' | awk '{total = total + $1}END{print 30 + (total % 6)}')

# Add "@hostname" if under ssh
is_ssh() {
  if [[ "$(ps -o comm= -p $PPID)" =~ "ssh" ]]; then
    echo "@\h"
  fi
}

# Display ruby version if ruby project
is_ruby_project() {
  if [[ -s ".ruby-version" || -s "Gemfile" ]]; then
    echo ":$(command -v rvm-prompt >/dev/null 2>&1 && printf "%s" "$(rvm-prompt)")"
  fi
}

# Set PS1
export PS1="[\e[${hostnamecolor}m\u$(is_ssh)\e[0m \w$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s$(is_ruby_project))")]\$ "

### Add Rust Cargo to PATH
[[ -s "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"

### Add NVM to PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### Add GVM to PATH
[[ -s "/home/sfo/.gvm/scripts/gvm" ]] && source "/home/sfo/.gvm/scripts/gvm"

### Add PostgreSQL to PATH
if [[ -d "/usr/pgsql-14/bin" ]]; then
  export PATH="/usr/pgsql-14/bin:$PATH"
elif [[ -d "/usr/pgsql-13/bin" ]]; then
  export PATH="/usr/pgsql-13/bin:$PATH"
elif [[ -d "/usr/pgsql-12/bin" ]]; then
  export PATH="/usr/pgsql-12/bin:$PATH"
fi

### Add Github gh completion
if [[ -f $(command -v gh) ]]; then
  eval "$(gh completion -s bash)"
fi

### Aliases
alias :q='exit'
alias boot.log='journalctl -b'
alias cp='\cp -u'
alias df='\df -hT --exclude-type=tmpfs --exclude-type=devtmpfs'
alias free='\free -h'
alias g='git'
alias l='\ls -CFv --color=auto'
alias la='\ls -AFv --color=auto'
alias ll='\ls -alFv --color=auto'
alias ln='ln -v'
alias ls='\ls -ACF --color=auto'
alias lsa='\ls -AFlhv --color=auto'
alias mkdir='\mkdir -p'
alias now='\date +"%Y/%m/%d %V %H:%M:%S"'
alias path='echo $PATH | tr -s ":" "\n"'
alias r='rails'
alias rs='rails s'
alias snaplist='sudo btrfs subvolume list /'
alias snaproot='sudo btrfs subvolume snapshot / /.snapshots/$(date +"%Y%m%d")'
alias sysup="sudo dnf update -y && sudo dnf autoremove -y && flatpak update -y"
alias wget='\wget -c'

if [[ "$TERM" == "xterm-kitty" ]]; then
  alias icat='kitty +kitten icat'
  alias fc-cache='\fc-cache -f && kitty + list-fonts --psnames'
fi

# Easy DL
if [[ -f $(command -v aria2c) ]]; then
  alias 2dl='aria2c -j 100 --allow-overwrite=true --seed-time=0'
  alias 2dls='aria2c -j 100 --allow-overwrite=true --seed-ratio=5'
fi
if [[ -f $(command -v youtube-dl) ]]; then
  alias ytdl="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"
fi

# Translate aliases
if [[ -f $(command -v trans) ]]; then
  alias trans_en='trans en:fr+ja'
  alias trans_fr='trans fr:en+ja'
  alias trans_jp='trans ja:en+fr'
fi

# Folders
if [[ -d "$HOME/Documents/Development/" ]]; then
  alias dev='cd ~/Documents/Development/'
fi
if [[ -d "$HOME/Documents/Development/sfeuga.com/www.sfeuga.com/" ]]; then
  alias web='cd ~/Documents/Development/sfeuga.com/www.sfeuga.com/ && git status'
fi
if [[ -d "$HOME/Documents/Development/Eclisse/musical-eureka" ]]; then
  alias eclisse='cd ~/Documents/Development/Eclisse/musical-eureka && git status'
fi
if [[ -d "$HOME/.dotfiles" ]]; then
  alias dots='cd ~/.dotfiles && git status'
fi

##############################################
### Do not put other lines after this code ###
##############################################

# Clean path
clean_path=$(echo "$PATH" | tr -s ':' '\n' | sort -u | tr '\n' ':' | rev | cut -c 2- | rev)
export PATH="$clean_path"
