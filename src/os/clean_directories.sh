#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

clean_directories() {

    declare -a DIRECTORIES=(
        "$HOME/Downloads/dotfiles_tmp"
    )

    for i in "${DIRECTORIES[@]}"; do
        rm -rf "$i"
    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n • Clean temple directories\n\n"
    clean_directories
}

main