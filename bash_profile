[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export GPG_TTY=$(tty)

[[ -s "/opt/hfs17.5/" ]] && cd /opt/hfs17.5/ && source houdini_setup_bash
