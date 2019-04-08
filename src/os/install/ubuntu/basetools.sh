#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Base Tools\n\n"

install_package "Transport https" "apt-transport-https"
install_package "CA-Certificates" "ca-certificates"
install_package "Software properties common" "software-properties-common"
install_package "Git" "git"
install_package "Curl" "curl"
install_package "Gdebi" "gdebi-core"