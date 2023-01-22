#!/bin/sh

echo $HOME

mkdir -p $HOME/.config
mkdir -p $HOME/.local/bin

# Local Bin Scripts
mkdir -p $HOME/.local/bin
cp ./bin/* $HOME/.local/bin

# xinitrc
ln -sn ./xinitrc $HOME/.xinitrc
ln -sn ./xprofile $HOME/.xprofile

# BSPWM
# TODO: Polybar setup
ln -sn ./bspwm $HOME/.config/polybar
ln -sn ./bspwm $HOME/.config/sxhkd
ln -sn ./bspwm $HOME/.config/bspwm

# NVIM
# TODO: packer installation script
ln -sn ./bspwm $HOME/.config/bspwm

# TMUX
ln -sn ./tmux $HOME/.config/tmux
