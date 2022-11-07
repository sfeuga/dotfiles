# Set aliases in a Fish way
function ls --description 'List contents of directory using exa'
  command exa -F --icons $argv
end
function la --description 'List contents of directory using exa, including hidden files in directory using long format'
  command exa -aF --icons $argv
end
function ll --description 'List contents using exa of directory using long format'
  command exa -Fl --icons $argv
end
function lsa --description 'List contents using exa of directory and hidden files using long format'
  command exa -aFl --icons $argv
end
function cat --description 'Cat clone with syntax highlighting and Git integration'
  command bat $argv
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

# DirEnv
#  https://github.com/direnv/direnv/blob/master/docs/hook.md
if test -e "$HOME/.asdf/installs/direnv"
  direnv hook fish | source
end

# Go
if test -e "$HOME/.asdf/installs/golang/"
  set -gx GOPATH (go env | grep GOPATH | sed 's/GOPATH=//' | sed 's/"//g')
  set -gxa PATH "$GOPATH/bin"
end

# Rust
if test -e "$HOME/.asdf/installs/rust/1.57.0"
  set -gxa PATH "$HOME/.asdf/installs/rust/1.57.0/bin"
end
