function git
  if test (count $argv) -ge 1
    switch $argv[1]
      case fetch pull push
        set -l current_email (command git config --local user.email)

        if test $current_email -a $current_email = "stephane.oshima@wealth-park.com"
          if test (vpn state) = 'diabled'
            vpn on > /dev/null
            command git $argv
            vpn off > /dev/null
          else
            command git $argv
          end
        else
          command git $argv
        end
      case '*'
        command git $argv
    end
  else
    command git
  end
end
