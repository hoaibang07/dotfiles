#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Terminal\n\n"

if ! package_is_installed "gconf2"; then

	execute "sudo apt --yes --force-yes install gconf2" \
	"install gconf2"

fi

execute "gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 12'" \
    "Change font size"

execute "export HISTSIZE=10000" \
	"Set history size = 10000"

execute "export HISTFILESIZE=10000" \
	"Set history file size = 10000"

