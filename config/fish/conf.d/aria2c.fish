if type -q aria2c
  abbr -a -g 2dl "aria2c -j 100 --allow-overwrite=true --seed-time=0"
  abbr -a -g 2dls "aria2c -j 100 --allow-overwrite=true --seed-ratio=5"
end
