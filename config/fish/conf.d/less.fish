# Add syntax color in Less
if type -q /usr/bin/src-hilite-lesspipe.sh
    set -gx LESSOPEN "| /usr/bin/src-hilite-lesspipe.sh %s"
    set -gx LESS " -NR"
else if type -q /usr/share/source-highlight/src-hilite-lesspipe.sh
    set -gx LESSOPEN "| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
    set -gx LESS " -NR"
end