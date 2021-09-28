function vpn
  if test (count $argv) -eq 1
    switch $argv
      case on
        vpn_on
      case off
        vpn_off
      case status
        vpn_status
      case state
        vpn_state
      case '*'
        echo Unknown $argv
        false
    end
  end
end

function vpn_on
  nmcli con up id Wealth-Park
end

function vpn_off
  nmcli con down id Wealth-Park
end

function vpn_status
  nmcli con show id Wealth-Park
end

function vpn_state
  nmcli con show Wealth-Park | grep GENERAL.STATE > /dev/null
  if test $status -eq 1
    echo diabled
  else
    echo enabled
  end
end
