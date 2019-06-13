#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

update
upgrade

./basetools.sh
./build-essentials.sh
./../nvm.sh
./browsers.sh
#./browsers.more.sh
./fonts.sh
./editors.sh
./yarn.sh
./mediatools.sh
./utility-tools.sh
./keyboard.sh
./config-guitools.sh
./../npm.sh
./tmux.sh
./../vim.sh
./developer-tools.sh
./php-mysql-tools.sh
./remove-default-apps.sh
./cleanup.sh
