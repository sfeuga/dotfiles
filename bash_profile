[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export GPG_TTY=$(tty)

[[ -s "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"

[[ -s "/opt/hfs17.5/" ]] && cd /opt/hfs17.5/ && source houdini_setup_bash
