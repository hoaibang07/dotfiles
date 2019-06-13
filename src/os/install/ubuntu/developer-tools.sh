#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Developer tools\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

download_and_install "Gitkraken" "https://release.gitkraken.com/linux/gitkraken-amd64.deb" "gitkraken"

#Install docker
if ! package_is_installed "docker-ce"; then
	add_key_ssl "https://download.docker.com/linux/ubuntu/gpg"
    add_to_source_list "[arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" "docker-ce.list" \
        || print_error "docker-ce (add to package resource list)"
    install_package "Install Docker ce" "docker-ce"
else
    print_success "docker-ce"
fi
