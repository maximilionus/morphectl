#!/bin/bash
set -e

TOOLCHAIN="./bin"

declare -A files=(
    ["morphe.jar"]="https://github.com/MorpheApp/morphe-desktop/releases/download/v2.1.1/morphe-desktop-2.1.1-all.jar"
    ["patches.mpp"]="https://github.com/MorpheApp/morphe-patches/releases/download/v2.1.0/patches-2.1.0.mpp"
    ["patches-tiktok.mpp"]="https://github.com/icysymmetra/tiktok-patches-for-morphe/releases/download/v0.9.0/patches-0.9.0.mpp"
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
