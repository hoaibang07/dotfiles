#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Remove Default Applications\n\n"

#Default game
execute "sudo apt-get remove aisleriot gnome-mahjongg gnome-mines gnome-sudoku" \
        "Remove default games"

#Default apps
execute "sudo apt-get purge totem totem-plugins" \
        "Remove default video app"

remove_apt_package "Remove Rhythmbox" "rhythmbox"