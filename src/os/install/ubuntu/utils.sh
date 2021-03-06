#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_key() {

    wget -qO - "$1" | sudo apt-key add - &> /dev/null
    #     │└─ write output to file
    #     └─ don't show output

}

add_key_ssl() {
    curl -fsSL "$1" | sudo apt-key add - &> /dev/null

}

add_ppa() {
    sudo add-apt-repository -y ppa:"$1" &> /dev/null
}

add_to_source_list() {
    sudo rm -rf /etc/apt/sources.list.d/$2
    sudo sh -c "printf 'deb $1' >> '/etc/apt/sources.list.d/$2'"
}

autoremove() {

    # Remove packages that were automatically installed to satisfy
    # dependencies for other packages and are no longer needed.

    execute \
        "sudo apt-get autoremove -qqy" \
        "APT (autoremove)"

}

install_package() {

    declare -r EXTRA_ARGUMENTS="$3"
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    if ! package_is_installed "$PACKAGE"; then
        execute "sudo apt-get install --allow-unauthenticated -qqy $EXTRA_ARGUMENTS $PACKAGE" "$PACKAGE_READABLE_NAME"
        #                                      suppress output ─┘│
        #            assume "yes" as the answer to all prompts ──┘
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi

}

package_is_installed() {
    dpkg -s "$1" &> /dev/null
}

update() {

    # Resynchronize the package index files from their sources.

    execute \
        "sudo apt-get update -qqy" \
        "APT (update)"

}

upgrade() {

    # Install the newest versions of all packages installed.

    execute \
        "export DEBIAN_FRONTEND=\"noninteractive\" \
            && sudo apt-get -o Dpkg::Options::=\"--force-confnew\" upgrade -qqy" \
        "APT (upgrade)"

}

download_and_install() {
    declare -r URL="$2"
    declare -r PACKAGE_READABLE_NAME="$1"
    declare -r PACKAGE="$3"
    if ! package_is_installed "$PACKAGE"; then
        fileName="$(basename -- $URL)"
        execute "wget -O $HOME/Downloads/dotfiles_tmp/$fileName $URL" "Downloading $PACKAGE_READABLE_NAME"
        execute "sudo gdebi --option=APT::Get::force-yes=1,APT::Get::Assume-Yes=1 -n $HOME/Downloads/dotfiles_tmp/$fileName" "Install $PACKAGE_READABLE_NAME"
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi    
}

snap_install_package() {
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"
    if ! snap_package_is_installed "$PACKAGE"; then
        execute \
        "sudo snap install $PACKAGE" \
        "$PACKAGE_READABLE_NAME"
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi
}

snap_package_is_installed() {
    snap list | grep "$1" &> /dev/null
}

remove_apt_package() {
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"
    execute \
        "sudo apt-get -y remove $PACKAGE" \
        "$PACKAGE_READABLE_NAME"
}
