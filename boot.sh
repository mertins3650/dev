#!/usr/bin/env bash

sudo apt update >/dev/null
sudo apt install -y git >/dev/null

echo "Cloning files....."
rm -rf $HOME/dev
git clone https://github.com/mertins3650/dev.git $HOME/dev >/dev/null


