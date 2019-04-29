#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "../../install/ubuntu/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Terminal\n\n"

execute "gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 12'" \
    "Change font size"

if ! package_is_installed "hstr"; then
	osv=""
	osv="$(get_os_version)"

	if [ "$osv" != "19.04" ]; then
	    execute "gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 12'" \
    		"Change font size"
	fi
fi


#hstr (history searching), support ubuntu <= 18.04
highest_version="19.04"
if (( $(echo "$(get_os_version) < $highest_version" |bc -l) )); then
  	if ! package_is_installed "hstr"; then
	    execute "sudo add-apt-repository ppa:ultradvorka/ppa && sudo apt-get update && sudo apt-get install hstr" \
    		"hstr - History searching for ubuntu"
	else
        print_success "hstr - History searching for ubuntu"
    fi
fi
