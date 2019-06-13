#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Editors\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "code"; then

    add_key "https://packages.microsoft.com/keys/microsoft.asc" \
        || print_error "Visual studio code (add key)"

    add_to_source_list "[arch=amd64] https://packages.microsoft.com/repos/vscode stable main" "vscode.list" \
        || print_error "Visual Studio Code (add to package resource list)"

    update &> /dev/null \
        || print_error "Visual Studio Code (resync package index files)"
    install_package "Visual studio code" "code"
else
    print_success "Visual studio code"
fi

if ! package_is_installed "sublime-text"; then

    add_key_ssl "https://download.sublimetext.com/sublimehq-pub.gpg" \
        || print_error "Sublime text (add key)"

    add_to_source_list "[arch=amd64] https://download.sublimetext.com/ apt/stable/" "sublime-text.list" \
        || print_error "Sublime text (add to package resource list)"

    update &> /dev/null \
        || print_error "Sublime text (resync package index files)"
    install_package "Sublime text" "sublime-text"
else
    print_success "Sublime text"
fi
