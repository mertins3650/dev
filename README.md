# My Dotfiles

This repository contains my personal dotfiles.
Run this on a fresh Arch Linux installation to setup.

## Structure

* `env/`: Contains dotfiles for various applications and tools.
* `misc/`: Contains miscellaneous files.
* `runs/`: Contains installation scripts for various programs.
* `dev-env`: A script for setting up dotfiles. 
* `run`: Installs programs

## Usage

To use these dotfiles, you can clone this repository and then run `dev-env` & `run`.

```bash
git clone https://github.com/mertins3650/dev.git
cd dev
export DEV_ENV=$(pwd)
./dev-env
./run
```
