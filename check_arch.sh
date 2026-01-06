#!/bin/bash

detect_architecture() {
    local arch=$(uname -m)
    
    case $arch in
        x86_64|x64)     echo "amd64" ;;
        i386|i686)      echo "i386" ;;
        armv7l|armhf)   echo "arm32" ;;
        aarch64|arm64)  echo "arm64" ;;
        *)              echo "unknown" ;;
    esac
}


ARCH=$(detect_architecture)
VALID_ARCHS=("amd64" "arm64" "i386" "arm32")


for valid_arch in "${VALID_ARCHS[@]}"; do
    if [ "$ARCH" == "$valid_arch" ]; then
        echo "$ARCH"
        exit 0
    fi
done

echo "unsupported"
exit 1
