#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Terminal\n\n"

execute "gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 12'" \
    "Change font size"

execute "export HISTSIZE=10000" \
	"Set history size = 10000"

execute "export HISTFILESIZE=10000" \
	"Set history file size = 10000"

execute "sudo add-apt-repository ppa:ultradvorka/ppa && sudo apt-get update && sudo apt-get install hstr && hstr --show-configuration >> ~/.bashrc && . ~/.bashrc" \
	"Install HSTR - History search for linux"
