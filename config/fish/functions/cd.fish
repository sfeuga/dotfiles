function cd -d "Set venv/rvm source when cd"
	builtin cd $argv
	
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