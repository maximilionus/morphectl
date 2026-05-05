#!/bin/bash

# CLI utility to apply selected Morphe patches.
# Copyright (C) 2026  Max Gashutin <maximilionuss@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

set -e

TOOLCHAIN="./bin"

if [[ ! -d $TOOLCHAIN ]]; then
    echo "Morphe toolchain not found!"
    ./install.sh
fi

patch_tiktok() {
    echo "- Patching TikTok"
    echo

    java -jar "$TOOLCHAIN/morphe-cli.jar" patch \
        --patches "$TOOLCHAIN/patches-derevanced.mpp" \
        --enable "SIM spoof" \
        "$1"

    echo
    echo "Done"
}

patch_spotify() {
    echo "- Patching Spotify"
    echo

    java -jar "$TOOLCHAIN/morphe-cli.jar" patch \
        --patches "$TOOLCHAIN/patches.mpp" \
        --exclusive \
        --enable "Spoof signature" \
        "$1"

    echo
    echo "Done"
}

package_name=$( basename "$1" )
case $package_name in
    com.zhiliaoapp.musically*)
        patch_tiktok "$1"
        ;;
    com.spotify.music*|Spotify*)
        patch_spotify "$1"
        ;;
    *)
        echo "No supported apk provided to script"
        ;;
esac
