#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Keyboard\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "ibus-teni"; then
    add_ppa "teni-ime/ibus-teni"
    install_package "Install ibus-teni" "ibus-teni"
    execute \
            "ibus restart" \
            "restart ibus"
    execute \
    		"sudo usermod -a -G input $USER"
else
    print_success "ibus-teni"
fi