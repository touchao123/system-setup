# Dev Workstation Setup

[![Ubuntu](https://github.com/ainsleyclark/system-setup/actions/workflows/ubuntu.yml/badge.svg?branch=master)](https://github.com/ainsleyclark/system-setup/actions/workflows/ubuntu.yml)

These scripts are designed to set up a dev workstation on macOS and Ubuntu. These scripts install programming languages
IDEs, productivity and communication applications as well as developer tools. You can see a list of what it installs
below.

## Important Note:
I understand these applications may not be for everyone, so please feel free to fork and edit as much as you want, it's
merley a boilerplate to go off!

## How to use
Simply download this repo or clone it and run the following:


**Ubuntu:**
```bash
sudo chmod +x ./ubuntu.sh
sudo -E sh -c "./ubuntu.sh"

```

or install target by select

```
sudo -E sh -c "./ubuntu.sh install_ubuntu_tools_tmux"
```

## Git
Git will be configured and a username and email address will be read at the beginning of the script and set globally.
The  `.gitignore` file that resides under `./git` will be copied and used globally to exclude any large library files from
new repositories.

## ZSH
[Oh My ZSH](https://ohmyz.sh/) will be installed and aliases and functions will be copied from the `zsh` folder if the
`post-install.sh` script is run. Please feel free to clone this repo and edit.

## Versions
You are able to set the specific versions of GoLang and PHP at the very top of the install scripts.

## What's installed

### Ubuntu

- Curl
- Git
- Chrome

