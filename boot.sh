#!/usr/bin/env bash

sudo apt update >/dev/null
sudo apt install -y git >/dev/null

read -p "Do you want to remove the $HOME/dev and clone the repository? (y/n): " clone_choice
if [[ "$clone_choice" != "y" ]]; then
    echo "Skipping cloning process. Exiting."
    exit 0
fi

echo "Cloning files..."
rm -rf "$HOME/dev"
if git clone https://github.com/mertins3650/dev.git "$HOME/dev" >/dev/null; then
    echo "Clone successful!"
else
    echo "Failed to clone repository. Exiting."
    exit 1
fi

read -p "Do you want to execute $HOME/dev/run? (y/n): " choice
if [[ "$choice" == "y" ]]; then
    if [[ -x "$HOME/dev/run" ]]; then
        "$HOME/dev/run"
    else
        echo "Error: $HOME/dev/run is not executable or does not exist."
        exit 1
    fi
else
    echo "Exiting."
    exit 0
fi

