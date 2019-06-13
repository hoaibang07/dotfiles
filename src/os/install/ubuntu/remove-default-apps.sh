#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Remove Default Applications and Game\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#Default game
execute "sudo apt-get -y remove aisleriot gnome-mahjongg gnome-mines gnome-sudoku" \
        "Remove default games"

#Default apps
execute "sudo apt-get -y purge totem totem-plugins" \
        "Remove default video app"

remove_apt_package "Remove Rhythmbox" "rhythmbox"
