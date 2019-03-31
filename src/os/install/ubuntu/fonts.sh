#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Fonts\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "ttf-mscorefonts-installe"; then

	execute "sudo apt-get --yes --force-yes install ttf-mscorefonts-installer" \
	"Install microsoft font"

fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
