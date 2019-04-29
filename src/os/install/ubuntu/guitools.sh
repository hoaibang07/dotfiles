#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   GUI config Tools\n\n"

install_package "xdotool" "xdotool"
install_package "gnome-tweak-tool" "gnome-tweak-tool"
install_package "dconf-tools" "dconf-tools"