#!/bin/bash

print_usage() {
    cat << EOF
usage: setup.sh [-h]

Setup of this repository's dotfiles. Just execute this bash script and the rest is hopefully intuitive enough.
This script will install the dotfiles to the current user's config directories.
EOF
}

prepare_env() {
    SCRIPTDIR_="$( dirname "$BASH_SOURCE" )"
    SCRIPTDIR=$(realpath $SCRIPTDIR_)
    CONFIG_PATH="/home/$USER/.config"
    
    if [ "$USER" = "root" ]; then
        echo "Are you absolutely sure you want to set the dotfile of the root user? (y/n)"
        echo -n ">"
        read -r READ_VALUE
        [ "$READ_VALUE" != "y" ] && echo "Aborting setup..." && exit 1;
        CONFIG_PATH="/root"
    fi
 
    echo "Directory of this dotfile repo: $SCRIPTDIR"

    echo "User directory to which we will set the dotfiles: $CONFIG_PATH"
    test -d $CONFIG_PATH || (echo "Creating config path" && mkdir -p $CONFIG_PATH)

    echo "Setting up $USER's dotfiles..."
}

# $1: Name of the program
ask_consent() {
    echo "Do you want to set up the program '$1'? (y/n)"
    echo -n ">"
    read -r READ_VALUE
    [ "$READ_VALUE" != "y" ] && return 1 || return 0;
}

# Setup tmux
setup_tmux() {
    ask_consent "tmux"
    [ "$?" != "0" ] && echo "Skipping tmux..." && return 1

    tmux -V || (echo "tmux not installed" && return 1)

    echo "Setting up tmux..."

    # Checking for existing tmux config
    test -d $CONFIG_PATH/tmux && echo "Backing up old config" && mv $CONFIG_PATH/tmux $CONFIG_PATH/tmux.bak || (echo "Something went wrong" && return 1)

    cp $SCRIPTDIR/tmux $CONFIG_PATH/tmux || (echo "Something went wrong on copying to $CONFIG_PATH/tmux" && return 1)

    echo "Finished setting up tmux"
}

# Setup neovim
setup_neovim() {
    ask_consent "neovim"
    [ "$?" != "0" ] && echo "Skipping nvim..." && return 1

    nvim -v || (echo "nvim not installed" && return 1)

    # Checking for existing tmux config
    test -d $CONFIG_PATH/nvim && echo "Backing up old config" && mv $CONFIG_PATH/nvim $CONFIG_PATH/nvim.bak || (echo "Something went wrong" && return 1)

    cp $SCRIPTDIR/nvim $CONFIG_PATH/nvim || (echo "Something went wrong on copying to $CONFIG_PATH/nvim" && return 1)

    echo "Finished setting up neovim"
}

# Setup zsh
setup_zsh() {
    ask_consent "zsh"
    [ "$?" != "0" ] && echo "Skipping zsh..." && return 1

    echo "ZSH still TODO..." && return 0

    zsh --version || (echo "zsh not installed" && return 1)

    echo "Setting up zsh..."
}

## Main

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            print_usage
            exit 0
    esac
done

prepare_env

setup_tmux

setup_neovim

setup_zsh
