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

# Add RVM to PATH for scripting.
#   Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"

# Add completion for RVM
export rvm_path="$HOME/.rvm"
# shellcheck disable=SC1090
[[ -r "$rvm_path/scripts/completion" ]] && . "$rvm_path/scripts/completion"
# Make RVM a function
# shellcheck disable=SC1090
[[ -r "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

### Add Rust Cargo to path
[[ -s "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"

### Aliases
alias date='\date +"%Y/%m/%d %V %H:%M:%S"'
alias boot.log='journalctl -b'
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

# Easy DL
if [[ -f $(command -v aria2c) ]]; then
  alias tdl='aria2c -j 100 --allow-overwrite=true --seed-time=0'
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
