function cd -d "Set venv/rvm source when cd"

    if test "$argv" = "-"
      set argv $old_pwd
      set -gx old_pwd (pwd)
      builtin cd $argv
    else
      set -gx old_pwd (pwd)
      builtin cd $argv
    end

    ### Python & venv
    if test -f ./venv/bin/activate
        source "./venv/bin/activate.fish"
    else
        if type -q deactivate
            deactivate 1>/dev/null 2>&1
        end
    end

    ### Ruby & RVM
    if type -q rvm
        if test -f ./.ruby-gemset
            rvm gemset use (cat .ruby-gemset)
        end
    end
end
