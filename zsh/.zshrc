# Add ssh private keys
for f in ~/.ssh/*; do
  if [[ ! "$f" =~ "config" && ! "$f" =~ "known_hosts"  && ! "$f" =~ ".pub" ]]; then
    ssh-add -q "$f";
  fi;
done

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    asdf
    direnv
    emoji
    emoji-clock
    git
    gitignore
    history
    history-substring-search
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source $HOME/.p10k.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias find_apple_app_id="mdls -name kMDItemCFBundleIdentifier -r"
alias gpg_kill_agent="gpgconf --kill gpg-agent"
alias gpg_secret_keys="gpg --list-secret-keys --keyid-format LONG"
alias gpg_public_keys="gpg --list-keys --keyid-format LONG"
alias ls="ls -AF --color=always"

alias dev="cd $HOME/Developments && reset"
alias work="cd $HOME/Developments/Abbeal/Cartier && reset"
alias be="cd $HOME/Developments/Abbeal/Cartier/*ackend && reset"
alias fe="cd $HOME/Developments/Abbeal/Cartier/*ontend && reset"

export GPG_TTY=$TTY

if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="no-cursor"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

if [ -f ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source "$HOME"/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  export HOMEBREW_NO_ENV_HINTS=true
  autoload -Uz compinit
  compinit

  alias bupdate="brew update && brew upgrade; brew upgrade --casks --greedy"
fi

unset LDFLAGS
unset CPPFLAGS

if [[ -e "/opt/homebrew/opt/binutils" ]]; then
  export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/binutils/include"
  export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/binutils/lib"
  export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
fi
if [[ -e "/opt/homebrew/opt/libpq" ]]; then
  export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/libpq/include"
  export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/libpq/lib"
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
fi
if [[ -e "/opt/homebrew/opt/openssl@3" ]]; then
  # A CA file has been bootstrapped using certificates from the system
  #   keychain. To add additional certificates, place .pem files in
  #           /opt/homebrew/etc/openssl@3/certs
  #
  #   and run
  #           /opt/homebrew/opt/openssl@3/bin/c_rehash

  export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/openssl@3/include"
  export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/openssl@3/lib"
  export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
fi

# asdf
if [ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ]; then
  . /opt/homebrew/opt/asdf/libexec/asdf.sh

  function asdf_update () {
    cat ~/.tool-versions | while read line; do
      if [[ ! "$line" =~ "java" ]]; then
        app=$(echo "$line" | awk '{print $1}')
        asdf install "$app" latest && asdf global "$app" latest
      fi
    done
    clear
    asdf list
  }

  alias aupdate=asdf_update
fi

# sysupdate
if alias bupdate &>/dev/null && alias aupdate &>/dev/null; then
  alias sysupdate="aupdate && bupdate"
elif alias bupdate &>/dev/null; then
  alias sysupdate=bupdate
elif alias aupdate &>/dev/null; then
  alias sysupdate=aupdate
fi

### Local bin
if [ -e "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi
if [ -e "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# NeoVim
if which nvim > /dev/null; then
  export EDITOR="nvim"
  alias vim=nvim
fi

# VSCode-oss / Codium
if which codium > /dev/null; then
  alias code=codium
fi
# VSCode
if [ -e "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]; then
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
fi

# JQ / GoJQ
if which gojq > /dev/null; then
  alias jq=gojq
fi

# Github-cli (https://cli.github.com)
if [[ -e "/opt/homebrew/bin/gh" || -e "$HOME/.asdf/shims/gh" ]]; then
  GH_NO_UPDATE_NOTIFIER=false
  export GH_NO_UPDATE_NOTIFIER

  if which bat > /dev/null; then
    GH_PAGER="bat -l diff --style='changes,grid'"
  else
    GH_PAGER="less"
  fi
  export GH_PAGER

  GLAMOUR_STYLE=dark
  export GLAMOUR_STYLE
fi

## Go
#if [[ -e "$HOME/go" ]]; then
#  go_root="$HOME/go"
#  if [[ -e "$HOME/go/bin" ]]; then
#    go_bin="$HOME/go/bin"
#    export PATH="$go_bin:$PATH"
#  fi
##elif [[ -e "$HOME/.asdf/installs/golang" ]]; then
##  go_root="$HOME/.asdf/installs/golang"
#fi
#
#if [[ -n "$go_root" ]]; then
#  latest_go_version=$(\ls --color=never $go_root | sort -hr | grep "^go.*" | head -n 1 | sed 's|/||')
#
#  export GOPATH="$go_root/$latest_go_version"
#  export PATH="$GOPATH/bin:$PATH"
#fi
if [[ -e "$HOME/.asdf/installs/golang" ]]; then
  source ~/.asdf/plugins/golang/set-env.zsh
  export ASDF_GOLANG_MOD_VERSION_ENABLED=true
fi

## Ruby
## Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#if [ -e "$HOME/.rvm/bin" ]; then
#  export PATH="$PATH:$HOME/.rvm/bin"
#fi

## JS
#if [ -e "$HOME/.nvm" ]; then
#  # NVM
#  export NVM_DIR="$HOME/.nvm"
#  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#fi

## GCP sdk
if [ -e "/opt/homebrew/bin/gcloud" ]; then
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
elif [ -e "/Users/sfo/bin/google-cloud-sdk" ]; then
  source "$HOME/bin/google-cloud-sdk/path.zsh.inc"
  source "$HOME/bin/google-cloud-sdk/completion.zsh.inc"
fi

# Docker Desktop
if [ -e "$HOME/.docker/bin" ]; then
  export PATH="$HOME/.docker/bin:$PATH"
fi
if [ -e "$HOME/.docker/cli-plugins" ]; then
  export PATH="$HOME/.docker/cli-plugins:$PATH"
fi

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
# pip zsh completion end

# Colima
autoload -U compinit; compinit
# alias for p in ; do kill -9 47834; done

function get_token() {
  case "$#" in
    0)
      echo "please provide a valid username or a username and a password"
      ;;
    *)
      if [[ "$#" == 2 ]]; then
        username="$1"
        password="$2"
      else
        username="$1"
        password="$username"
      fi
      clear
      token=$(curl -s --location 'http://localhost:8080/realms/Cartier/protocol/openid-connect/token' \
              --header 'Content-Type: application/x-www-form-urlencoded' \
              --data-urlencode 'client_id=mapper-backend' \
              --data-urlencode 'grant_type=password' \
              --data-urlencode 'client_secret=1234-CARTIER-5678' \
              --data-urlencode 'scope=openid' \
              --data-urlencode "username=$username" \
              --data-urlencode "password=$password" | jq .access_token | sed 's/"//g')
      echo "$token"
      ;;
  esac
}

function jewelry_token() {
  clear
  token=$(curl -s --location 'http://localhost:8080/realms/Cartier/protocol/openid-connect/token' \
          --header 'Content-Type: application/x-www-form-urlencoded' \
          --data-urlencode 'client_id=mapper-backend' \
          --data-urlencode 'grant_type=password' \
          --data-urlencode 'client_secret=1234-CARTIER-5678' \
          --data-urlencode 'scope=openid' \
          --data-urlencode 'username=jewelry' \
          --data-urlencode 'password=jewelry' | jq .access_token | sed 's/"//g')
  echo "$token"
}

function nobody_token() {
  clear
  token=$(curl -s --location 'http://localhost:8080/realms/Cartier/protocol/openid-connect/token' \
          --header 'Content-Type: application/x-www-form-urlencoded' \
          --data-urlencode 'client_id=mapper-backend' \
          --data-urlencode 'grant_type=password' \
          --data-urlencode 'client_secret=1234-CARTIER-5678' \
          --data-urlencode 'scope=openid' \
          --data-urlencode 'username=nobody' \
          --data-urlencode 'password=nobody' | jq .access_token | sed 's/"//g')
  echo "$token"
}

function hq_token() {
  clear
  token=$(curl -s --location 'http://localhost:8080/realms/Cartier/protocol/openid-connect/token' \
          --header 'Content-Type: application/x-www-form-urlencoded' \
          --data-urlencode 'client_id=mapper-backend' \
          --data-urlencode 'grant_type=password' \
          --data-urlencode 'client_secret=1234-CARTIER-5678' \
          --data-urlencode 'scope=openid' \
          --data-urlencode 'username=hq' \
          --data-urlencode 'password=hq' | jq .access_token | sed 's/"//g')
  echo "$token"
}

function watchmaking_token() {
  clear
  token=$(curl -s --location 'http://localhost:8080/realms/Cartier/protocol/openid-connect/token' \
          --header 'Content-Type: application/x-www-form-urlencoded' \
          --data-urlencode 'client_id=mapper-backend' \
          --data-urlencode 'grant_type=password' \
          --data-urlencode 'client_secret=1234-CARTIER-5678' \
          --data-urlencode 'scope=openid' \
          --data-urlencode 'username=watchmaking' \
          --data-urlencode 'password=watchmaking' | jq .access_token | sed 's/"//g')
  echo "$token"
}

function rebase {
  reset

  for f in $(git s | grep -E "UU|AA" | awk '{print $2}'); do
    vim "$f" && git add "$f"
  done

  clear

  export KEYCLOAK=False && python -m coverage run -m unittest -vv

  git status
}
#git last | grep Author | awk -F ': ' '{print }' | sed 's/>//' | awk -F ' <' '{print }'

rm() {
   mv "$@" "$HOME"/.Trash/
}

alias grepython="ps aux | grep python | grep -v grep | grep -v vscode"
