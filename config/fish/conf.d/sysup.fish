if type -q dnf
  set pkg_manager "set_color -b white; set_color black; echo ' DNF: '; set_color normal; and sudo dnf update -y; and sudo dnf autoremove -y"
else if type -q apt
  set pkg_manager "set_color -b white; set_color black; echo ' APT: '; set_color normal; and sudo apt update -y; and sudo apt upgrade -y; and sudo apt autoremove -y"
end

if type -q snap
  set snap "; and set_color -b white; set_color black; echo ' SNAP: '; set_color normal; and sudo snap refresh"
else
  set snap ''
end

if type -q flatpak
  set flatpak "; and set_color -b white; set_color black; echo ' FLATPAK: '; set_color normal; and flatpak update -y"
else
  set flatpak ''
end

if test -d '/home/sfo/.asdf'
  set asdf "; and set_color -b white; set_color black; echo ' ASDF: '; set_color normal; and asdf plugin-update --all"
else
  set asdf ''
end

abbr -a -g sysup "$pkg_manager$snap$flatpak$asdf"
