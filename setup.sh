#!/usr/bin/env bash


read -p "Do you want to remove  $HOME/dev and clone the repository? (y/n): " clone_choice
if [[ "$clone_choice" != "y" ]]; then
    echo "Exiting."
    exit 0
else
    echo "Cloning files..."
    sudo apt-get update >/dev/null
    sudo apt-get install -y git >/dev/null
    rm -rf "$HOME/dev"
    if git clone https://github.com/mertins3650/dev.git "$HOME/dev" >/dev/null; then
        echo "Clone successful!"
    else
        echo "Failed to clone repository. Exiting."
        exit 1
    fi
fi

read -p "Do you want to execute $HOME/dev/run? (y/n): " run_choice
if [[ "$run_choice" == "y" ]]; then
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

