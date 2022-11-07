function vim
  if test $EDITOR = nvim
    if test (count $argv) -eq 0
      if test -e Session.vim
        command nvim -S
      else
        command nvim
      end
    else if test (count $argv) -ge 1
      command nvim $argv
    else
      command nvim
    end
  else if test $EDITOR = vi
    command vi
  else
    command vim
  end
end
