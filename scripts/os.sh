#!/usr/bin/env bash

case "$(uname -a)" in
    Linux*microsoft-standard-WSL2*) export OS="wsl" ;;
    Linux*)                         export OS="linux" ;;
    Darwin*)                        export OS="mac" ;;
    *)                              export OS="unknown" ;;
esac
