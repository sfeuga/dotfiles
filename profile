[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source "$rvm_path/contrib/ps1_functions"
ps1_set
export GPG_TTY=$(tty)

export PATH="$HOME/.cargo/bin:$PATH"
