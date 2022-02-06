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

function asdf_update --description "An easy way to update your default app"
  if test -f "$HOME/.tool-versions"
    for app in (cat "$HOME/.tool-versions")
      set app_name (echo "$app" | awk '{print $1}')
      set app_version (echo "$app" | awk '{print $2}')

      # Java is a bit different, so we need to change the name to the flavor we use
      if test 'java' = "$app_name"
        # I'm using openjdk
        set app_latest_version (asdf latest java openjdk)
      else
        set app_latest_version (asdf latest "$app_name")
      end

      echo "Checking $app_name:"
      if test "$app_version" = "$app_latest_version"
        echo -e "\tNo Update"
      else
        echo -e "\tCurrent version:\t$app_version\n\tLatest version: \t$app_latest_version"

        if test "$app_version" = "$app_latest_version"
          echo "Do you want to install this new version? (y/N)"
          read install
          if test "$install" = 'y'; or "$install" = 'Y'
            asdf install "$app_name" "$app_latest_version"
            asdf global "$app_name" "$app_latest_version"
          end
        end
      end
    end
  end
end

if test -d "$HOME/.asdf"
  set asdf "; and set_color -b white; set_color black; echo ' ASDF: '; set_color normal; and asdf plugin-update --all; and asdf_update"
else
  set asdf ''
end

abbr -a -g sysup "$pkg_manager$snap$flatpak$asdf"
