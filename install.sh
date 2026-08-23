#!/bin/bash
set -e

TOOLCHAIN="./bin"

declare -A files=(
    ["morphe.jar"]="https://github.com/MorpheApp/morphe-desktop/releases/download/v1.13.2/morphe-desktop-1.13.2-all.jar"
    ["patches.mpp"]="https://github.com/MorpheApp/morphe-patches/releases/download/v1.39.1/patches-1.39.1.mpp"
    ["patches-tiktok.mpp"]="https://github.com/icysymmetra/tiktok-patches-for-morphe/releases/download/v0.7.0/patches-0.7.0.mpp"
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
