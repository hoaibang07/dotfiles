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
./misc.sh
./misc_tools.sh
./compression_tools.sh
./image_tools.sh
./guitools.sh
./../npm.sh
./tmux.sh
./../vim.sh
./remove_default_apps.sh
./cleanup.sh
