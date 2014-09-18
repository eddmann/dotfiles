#!/bin/bash

# Get the absolute path to the current directory.
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Define home folder.
root="$HOME"

# Define all files/folders to be symlinked into home directory.
files="aliases bash_profile bashrc functions gitconfig gitignore inputrc my.cnf screenrc vimrc bashmarks.sh liquidpromptrc"
for f in $files; do
    echo "Creating symlink to $f at ${root}/.$f"
    rm -f ${root}/.$f
    ln -s $dir/$f ${root}/.$f
done
unset f

# Create bin folder.
echo "Creating ${root}/bin"
mkdir ${root}/bin

# Create extra dotfile.
touch ${root}/.extra

# OS specific.
if [[ $1 ]]; then
    if [ -d "${dir}/${1}" ]; then
        # Symlink OS specifc dotfiles, if present.
        echo "Creating symlink to /${1} at ${root}/.os"
        rm -rf ${root}/.os
        ln -s "${dir}/${1}" ${root}/.os

        # Run OS specific bootstrap, if present.
        if [ -f ${root}/.os/bootstrap.sh ]; then
            echo "Loading /${1} bootstrap file"
            source ${root}/.os/bootstrap.sh
        fi
    fi
fi

source ~/.bash_profile