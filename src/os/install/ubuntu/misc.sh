#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

install_package "Transmission" "transmission"
install_package "VLC" "vlc"
add_ppa "yannubuntu/boot-repair"
install_package "Install Boot repair" "boot-repair"

download_and_install "Skype" "https://repo.skype.com/latest/skypeforlinux-64.deb"
snap_install_package "Slack" "slack"

install_package "Terminator" "terminator"

download_and_install "Gitkraken" "https://www.gitkraken.com/download/linux-deb"
