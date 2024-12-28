#!/usr/bin/env bash

# gum is needed for selection
cd /tmp || exit 1
GUM_VERSION="0.14.3"
wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb"
sudo apt-get install -y ./gum.deb
if ! command -v gum >/dev/null 2>&1; then
    echo "Error: gum installation failed. Exiting."
    exit 1
fi
[[ -f gum.deb ]] && rm gum.deb
cd - || exit 1

CHOICE1=("Yes" "No")
answer1=$(gum choose "${CHOICE1[@]}" --height 10 --header "Clone repository?")

if [[ "${answer1,,}" == "no" ]]; then
    echo "Exiting."
    exit 0
else
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
fi

CHOICE2=("Yes" "No")
answer2=$(gum choose "${CHOICE2[@]}" --height 10 --header "Install apps?")
if [[ "$answer2" == "Yes" ]]; then
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

