#!/bin/bash
set -e

TOOLCHAIN="./bin"

declare -A files=(
    ["morphe-cli.jar"]="https://github.com/MorpheApp/morphe-cli/releases/download/v1.8.0/morphe-cli-1.8.0-all.jar"
    ["patches.mpp"]="https://github.com/MorpheApp/morphe-patches/releases/download/v1.25.0/patches-1.25.0.mpp"
    ["patches-derevanced.mpp"]="https://github.com/RookieEnough/De-ReVanced/releases/download/v1.0.3/patches-1.0.3.mpp"
)


mkdir -p "$TOOLCHAIN"

for file_name in "${!files[@]}"; do
    echo "Downloading $file_name ..."
    curl --progress-bar -L -o "$TOOLCHAIN/$file_name" \
        "${files[$file_name]}"
    echo
done

echo
echo "Toolchain ready for use"
