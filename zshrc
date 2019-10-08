if [[ -f $(which vim) ]]; then
  mkdir -p $HOME/.vim/{backup,swap,undo}
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sfeuga/.oh-my-zsh"
export TERM="xterm-256color"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#POWERLEVEL9K_MODE="nerdfont-complete"
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME=random

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory                # add history in append mode
setopt sharehistory                 # share history between shell
setopt incappendhistory             # add history right now (instead of at the terminal close)
# setopt autocd
# setopt beep
# setopt extendedglob
# unsetopt nomatch
# unsetopt notify
bindkey -e                          # Set to emacs mode
#bindkey -v                          # Set to vi mode


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Completion
fpath=(~/.zsh/completion $fpath)

if [[ -d /usr/local/share/zsh-completions ]]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' menu select=2

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Add home bin folder to path
if [[ -d $HOME/.bin ]]; then
  export PATH="$HOME/.bin:$PATH"
  local_bin="$HOME/.bin"
elif [[ -d $HOME/bin ]]; then
  export PATH="$HOME/bin:$PATH"
  local_bin="$HOME/bin"
else
  mkdir -p $HOME/bin
  export PATH="$HOME/bin:$PATH"
  local_bin="$HOME/bin"
fi

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

### ~/.man
if [[ -d $HOME/.man ]]; then
  export MANPATH="$HOME/.man:$MANPATH"
fi

### Add color to less
if [[ -f $(which src-hilite-lesspipe.sh) ]]; then
  export LESSOPEN="| $(which src-hilite-lesspipe.sh) %s"
  export LESS=' -RN '
else
  export LESS=' -N '
fi

### Add color to man
if [[ -f $(which most) ]]; then
  export MANPAGER="$(which most) -s"
fi

### adb-fastboot for android devices
if [[ -d $local_bin/adb-fastboot/ ]]; then
  export PATH="$PATH:$local_bin/adb-fastboot";
fi


#############################
##### Aliases & Helpers #####
#############################
alias weekNumber='date +%V'
alias wn='weekNumber'

alias ls='ls -AF --color=tty'
alias lsa='ls -AFlh --color=tty'
alias df='df -h'
alias du='du -h'
alias free='free -h'

### Git
if [[ -f $(which git) ]]; then

  # Git Completion
  if [[ -f $local_bin/.git-completion.zsh ]]; then
    source $local_bin/.git-completion.zsh
  fi

  alias got='git '
  alias gti='git '
  alias gut='git '
  alias hit='git '

  function FindUnusedGitBranch () {
    branchList=$(
      for branch in $(git branch -r | egrep -v -w 'HEAD|master|qa|V2'); do
        echo -e "$(git show --format="%cr" $branch | head -n 1) \\t$branch" | egrep -w 'month|months|year|years';
      done | awk '{print $NF}' | sed 's|origin/||'
    )
  }

  function CleanBranch () {
    branch=$(git remote prune origin -n | grep 'origin/' | awk -F '/' '{ print $2 }');
    if [ -n "$branch" ]; then
      git remote prune origin;
      git branch -D $(for b in $(echo $branch); do printf "$b "; done;) 2> /dev/null;
    else
      echo "There is no branch to clean.";
    fi
  }

  function DeleteUnusedBranch () {
    cleanBranch
    FindUnusedGitBranch
    git push origin $branchList --delete -n
    echo -n "Did you want to delete all this remote branchs (y|N) :"
    read yn
    case $yn in
      [yY] | [yY][Ee][Ss] )
        git push origin $branchList --delete;
        ;;
      [nN] | [n|N][O|o] )
        exit 1;
        ;;
    esac
  }

  function LastCommitNumber () {
    commitNumber=$(git log -n 1 | head -n 1 | awk '{print $NF}')
  }

  function GetBackToWork () {
    if [ $(git log --pretty=oneline -n 1 | awk '{print $2}') == "WIP" ]; then
      git reset --soft HEAD~1 && git unstage
    else
      echo "The last commit on this branch was not \"WIP\""
    fi
  }
fi

if [[ -f $(which aria2c) ]]; then
  alias dlt='aria2c --seed-time=0'
fi

if [[ -f $(which youtube-dl) ]]; then
  alias ytdl="youtube-dl -f '(best)[protocol^=http]' -o '~/Movies/%(title)s.%(ext)s'"
fi

### Docker & Docker-compose
if [[ -f $(which docker) ]]; then
  alias docAllStop='docker stop $(ActiveContainerIds)'
  alias docRedisCli='docker exec -it $(redisContainerId) redis-cli'
  alias docSidekiqLogs='docker logs -f $(sidekiqContainerId)'
  alias restartSidekiqContainer='containerId=$(sidekiqContainerId) && docker stop $containerId && docker start $containerId'

  if [[ -f $(which docker-compose) ]]; then
    alias doc='docker-compose '
    alias docDev='docker-compose -f $(find . -iname *dev.yml)'
    alias docDevRun='docdev run --rm '
    alias docDevUp='docdev up'
    alias docRun='doc run --rm '
    alias docUp='docker-compose up'
  fi

  function ActiveContainerIds () {
    echo $(docker ps | grep -v CONTAINER | awk 'BEGIN { ORS=" " }; { print $1 }')
  }

  function ActiveContainerNames () {
    echo $(docker ps | grep -v CONTAINER | awk 'BEGIN { ORS=" " }; { print $NF }')
  }

  function redisContainerId () {
    echo $(docker ps | grep -m 1 redis | awk '{ print $NF }')
  }

  function sidekiqContainerId () {
    echo $(docker ps | grep -m 1 sidekiq | awk '{ print $NF }')
  }
fi


###################
##### helpers #####
###################

### Ruby
MyFiles="git status -s | awk '{print $NF}' | grep .rb"
MyFilesAfterCommit="git diff-tree --no-commit-id --name-only -r $commitNumber | grep \.rb"
RubocopText="echo -e \"${On_White}           ${Color_Off}\n${Black}${On_White} Rubocop : ${Color_Off}\n${On_White}           ${Color_Off}\""
ReekText="echo -e \"${On_White}        ${Color_Off}\n${Black}${On_White} Reek : ${Color_Off}\n${On_White}        ${Color_Off}\""

function RubocopMyFiles () {
  eval $RubocopText;
  for f in $(eval $MyFiles); do
    echo -e "\n${Green}$f${Color_Off}: ";
    rubocop $f;
  done
  echo "---------------------------";
}

function RubocopAfterCommit () {
  LastCommitNumber
  eval $RubocopText;
  for f in $(eval $MyFilesAfterCommit); do
    echo -e "\n${Green}$f${Color_Off}: ";
    rubocop $f;
  done;
  echo "---------------------------";
}

function ReekMyFiles () {
  eval $ReekText;
  for f in $(eval $MyFiles); do
    echo -e "\n${Green}$f${Color_Off}: ";
    reek $f;
  done;
  echo "---------------------------";
}

function ReekAfterCommit () {
  LastCommitNumber
  eval $ReekText;
  for f in $(eval $MyFilesAfterCommit); do
    echo -e "\n${Green}$f${Color_Off}: ";
    reek $f;
  done;
  echo "---------------------------";
}

### Heroku
#
# .heroku_projects example:
#   an heroku app name
#   another heroku app name
#   a third heroku app name
#
if [[ -f "~/.heroku_projects" ]]; then
else
  touch ~/.heroku_projects
fi

function GetLastCredentials () {
  for heroku_app in $(cat ~/.heroku_projects); do
    echo "/tmp/$heroku_app.env" && heroku config --app $heroku_app --shell > /tmp/$heroku_app.env;
  done;
}


### Ruby Manager
# rbenv or rvm
if [[ -d $HOME/.rbenv/bin ]]; then
  export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
  eval "$(rbenv init -)"
  [[ -f $HOME/.rbenv/completions/rbenv.zsh ]] && source ~/.rbenv/completions/rbenv.zsh
elif [[ -d $HOME/.rvm/bin ]]; then
  export PATH="$HOME/.rvm/bin:$PATH"
  source $HOME/.rvm/scripts/rvm
fi

### APFS Fuse
# https://github.com/sgan81/apfs-fuse
# To build on Fedora 28, install first:
#   fuse fuse-libs fuse-devel
#   zlib zlib-devel
#   libattr libattr-devel
#   bzip2 bzip2-libs bzip2-devel
#   icu libicu-devel libicu
#   gcc gcc-c++
#   cmake
#if [[ -d $HOME/bin/apfs-fuse/build/bin ]]; then
#  export PATH="$HOME/bin/apfs-fuse/build/bin:$PATH"
#fi
