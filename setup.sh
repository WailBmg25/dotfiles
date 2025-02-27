#!/bin/bash

# Function to install GNU Stow
install_stow() {
    if command -v stow &> /dev/null; then
        echo "GNU Stow is already installed."
    else
        echo "Installing GNU Stow..."
        if [[ -f /etc/debian_version ]]; then
            sudo apt update && sudo apt install -y stow
        elif [[ -f /etc/arch-release ]]; then
            sudo pacman -Syu stow --noconfirm
        elif [[ -f /etc/fedora-release ]]; then
            sudo dnf install -y stow
        else
            echo "Unsupported distribution. Please install GNU Stow manually."
            exit 1
        fi
    fi
}

# Function to deploy dotfiles using Stow
deploy_dotfiles() {
    echo "Deploying dotfiles..."
    stow -v -R -t ~ */
}

# Main script execution
install_stow
deploy_dotfiles
