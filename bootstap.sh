#!/bin/bash

# Modified from the linked bootstrap below
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

# Get the absolute path to the current directory
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
files="aliases bash_profile bash_prompt bashrc functions gitconfig gitignore screenrc vimrc"

for file in $files; do
  echo "Creating symlink to $file in home directory."
  rm -f ~/.$file
  ln -s $dir/$file ~/.$file
done

source ~/.bash_profile