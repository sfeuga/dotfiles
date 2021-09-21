# Add color to man
if type -q most
    set -l pager (type -p most)
    set -gx MANPAGER "$pager -s"
end