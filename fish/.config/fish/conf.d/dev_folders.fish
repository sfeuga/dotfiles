if test -d $HOME/Documents/Development/
  abbr -a -g dev cd "$HOME/Documents/Development/"

  for folder in (command ls -d "$HOME/Documents/Development/"*/)
    set -l folder (echo $folder | string split --right --max 1 --no-empty /)
    set -l folder_name (echo $folder | \
                          string split --max 1 --no-empty "$HOME/Documents/Development/" | \
                          string trim -c /)
    abbr -a -g "dev-$folder_name" cd $folder
  end

  if test -d $HOME/Documents/Development/WealthPark/
    for folder in (command ls -d "$HOME/Documents/Development/WealthPark/"*/)
      set -l folder (echo $folder | string split --right --max 1 --no-empty /)
      set -l folder_name (echo $folder | \
                            string split --max 1 --no-empty "$HOME/Documents/Development/WealthPark/" | \
                            string trim -c /)
      abbr -a -g "wp-$folder_name" cd $folder
    end
  end

  if test -d $HOME/Documents/Development/sfeuga.com/www.sfeuga.com/
    abbr -a -g web cd "$HOME/Documents/Development/sfeuga.com/www.sfeuga.com"
  end

  if test -d $HOME/Documents/Development/Eclisse/musical-eureka
    abbr -a -g eclisse cd "$HOME/Documents/Development/Eclisse/musical-eureka"
  end
end
