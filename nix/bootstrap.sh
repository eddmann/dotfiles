#!/bin/bash

# Get the absolute path to the current directory.
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Define home folder.
root="$HOME"

# Define all files/folders to be symlinked into home directory.
files="Xresources"
for f in $files; do
    echo "Creating symlink to $f at ${root}/.$f"
    rm -f ${root}/.$f
    ln -s $dir/$f ${root}/.$f
done
unset f

# Symlink Awesome WM config.
echo "Creating symlink to rc.lua at ${root}/.config/awesome/rc.lua"
mkdir -p ${root}/.config/awesome
rm -f ${root}/.config/awesome/rc.lua
ln -s $dir/rc.lua ${root}/.config/awesome/rc.lua