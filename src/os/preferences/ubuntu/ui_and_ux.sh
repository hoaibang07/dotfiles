#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   UI & UX\n\n"

execute "gsettings set org.gnome.desktop.background picture-options 'stretched'" \
    "Set desktop background image options"

execute "gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'" \
    "Set close, maximize, minimize to left side"

execute "touch ~/Templates/'Untitled Document'" \
    "Add New Document into context menu in Nautilus"

