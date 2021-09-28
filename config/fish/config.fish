# RVM
if test -f ~/.rvm
  set -U fish_greetingrvm default
end

# ASDF
#   https://asdf-vm.com/guide/getting-started.html#_2-download-asdf
if test -f ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish

  if not test -f ~/.config/fish/completions/asdf.fish
    mkdir -p ~/.config/fish/completions && \
      ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions/asdf.fish
    end
end

# Go
if test -e "$HOME/.asdf/installs/golang/"
  set -gx GOPATH (go env | grep GOPATH | sed 's/GOPATH=//' | sed 's/"//g')
  set -gxa PATH "$GOPATH/bin"
end
