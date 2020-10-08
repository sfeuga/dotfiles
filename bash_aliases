### Make less more friendly for non-text input files, see lesspipe(1)
# Add color to less
function pygmentize_less () {
  if [[ -f $(command -v pygmentize) ]]; then
    export LESSCOLORIZER='pygmentize'
  fi
}

if [[ -x $(command -v lesspipe.sh) ]]; then
  export LESSOPEN="|/usr/bin/lesspipe.sh %s"
  pygmentize_less
elif [[ -x $(command -v lesspipe) ]]; then
  eval "$(SHELL=/bin/sh lesspipe)"
  pygmentize_less
elif [[ -f "$HOME/.lessfilter" ]]; then
  export LESSOPEN="|$HOME/.lessfilter %s"
  pygmentize_less
fi
export LESS=' -RN'

### Add color to man
if [[ -f $(command -v most) ]]; then
  MOST_PATH=$(command -v most)
  export MANPAGER="$MOST_PATH -s"
fi

### Add RVM to PATH
#   Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"
# Add completion for RVM
export rvm_path="$HOME/.rvm"
# shellcheck disable=SC1090
[[ -r "$rvm_path/scripts/completion" ]] && . "$rvm_path/scripts/completion"
# Make RVM a function
# shellcheck disable=SC1090
[[ -r "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

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

### Aliases
alias :q='exit'
alias now='\date +"%Y/%m/%d %V %H:%M:%S"'
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
alias path='echo $PATH | tr -s ":" "\n"'
alias wget='\wget -c'
alias sound="echo -ne '\007'"
alias sysup="sudo dnf update -y && sudo dnf autoremove -y && flatpak update -y"
alias snaplist='sudo btrfs subvolume list /'
alias snaproot='sudo btrfs subvolume snapshot / /.snapshots/$(date +"%Y%m%d")'
## Git aliases
alias gta='git add'
alias gtc='git commit -m '
alias gtca='git commit --amend'
alias gtcan='git commit --amend --no-edit'
alias gtd='git diff'
alias gtl="git log --graph --pretty=format:'%C(yellow)%h%Creset -%Cred%d%Creset %s %Cgreen| %cr %C(bold blue)| %an%Creset' --abbrev-commit --date=relative"
alias gtp='git push'
alias gtpf='git push -f'
alias gts='git status'

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

