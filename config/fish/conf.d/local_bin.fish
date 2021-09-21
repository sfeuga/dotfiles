if test -e "$HOME/.local/bin"
    set -gx PATH "$PATH:$HOME/.local/bin"
end
if test -e "$HOME/bin"
    set -gx PATH "$PATH:$HOME/bin"
end