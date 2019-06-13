#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Utilities\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "ShellCheck" "shellcheck"
install_package "xclip" "xclip"
install_package "rar" "rar"
install_package "unrar" "unrar"
install_package "Transmission" "transmission"

if ! package_is_installed "boot-repair"; then
    add_ppa "yannubuntu/boot-repair"
    install_package "Install Boot repair" "boot-repair"
else
    print_success "Boot repair"
fi

install_package "Terminator" "terminator"
download_and_install "Skype" "https://repo.skype.com/latest/skypeforlinux-64.deb" "skypeforlinux"
snap_install_package "Slack" "slack --classic"
