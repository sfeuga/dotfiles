if type -q dnf
    abbr -a -g sysup "sudo dnf update -y; and sudo dnf autoremove -y; and flatpak update -y"
else if type -q apt
    if type -q snap
        abbr -a -g sysup "sudo apt update -y; and sudo apt upgrade -y; and sudo apt autoremove -y; and sudo snap refresh; and flatpak update -y"
    else
        abbr -a -g sysup "sudo apt update -y; and sudo apt upgrade -y; and sudo apt autoremove -y; and flatpak update -y"
    end
end