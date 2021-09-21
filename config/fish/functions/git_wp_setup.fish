### Setup account to sign git commit for WealthPark
function git_wp_setup
 	if test -e .git
 		command git config --local user.email stephane.oshima@wealth-park.com
    	command git config --local user.signingKey 2AD5054BE235EBE6
 	end
 end