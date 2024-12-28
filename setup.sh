#!/usr/bin/env bash

# gum is needed for selection
set -e
TMP_DIR=$(mktemp -d)
GUM_VERSION="0.14.3"
GUM_DEB="${TMP_DIR}/gum_${GUM_VERSION}_amd64.deb"

# Download and install gum
wget -qO "${GUM_DEB}" "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb"
sudo apt-get install -y "${GUM_DEB}"
rm -rf "${TMP_DIR}"

if ! command -v gum >/dev/null 2>&1; then
    echo "Error: gum installation failed. Exiting."
    exit 1
fi

# Prompt to clone repository
answer1=$(gum choose "Yes" "No" --height 10 --header "Clone repository?")
if [[ "${answer1}" == "Yes" ]]; then
    echo "Cloning files..."
    sudo apt-get update >/dev/null 2>&1
    sudo apt-get install -y git >/dev/null 2>&1
    rm -rf "$HOME/dev"
    if git clone https://github.com/mertins3650/dev.git "$HOME/dev" >/dev/null; then
        echo "Clone successful!"
    else
        echo "Failed to clone repository. Exiting."
        exit 1
    fi
else
    echo "Exiting."
    exit 0
fi

# Prompt to install apps
answer2=$(gum choose "Yes" "No" --height 10 --header "Install apps?")
if [[ "${answer2}" == "Yes" ]]; then
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

# Prompt to set up development environment
answer3=$(gum choose "Yes" "No" --height 10 --header "Set up development environment?")
if [[ "${answer3}" == "Yes" ]]; then
    if [[ -x "$HOME/dev/dev-env" ]]; then
        "$HOME/dev/dev-env"
    else
        echo "Error: $HOME/dev/dev-env is not executable or does not exist."
        exit 1
    fi
else
    echo "Exiting."
    exit 0
fi

