#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Developer tools\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

download_and_install "Gitkraken" "https://release.gitkraken.com/linux/gitkraken-amd64.deb" "gitkraken"

#Install docker
snap_install_package "docker" "docker"
