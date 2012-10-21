#!/bin/bash

# Get the absolute path to the current directory
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Define all files/folders to be symlinked into home directory
files="bin aliases bash_profile bash_prompt bashrc functions gitconfig gitignore inputrc screenrc vimrc"
for f in $files; do
  echo "Creating symlink to $f in home directory."
  rm -f ~/.$f
  ln -s $dir/$f ~/.$f

  if [ -f "${f}_${1}" ]; then
    echo "- Creating symlink to ${f}_${1} in home directory."
    rm -f ~/."${f}_os"
    ln -s "${dir}/${f}_${1}" ~/."${f}_os"
  fi
done
unset f

# Add Sublime Text 2 console bin symlink, if OSX
if [[ $1 = "osx" ]]; then
  echo "Creating symlink to Sublime Text 2 console binary."
  ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/.bin/subl
fi

source ~/.bash_profile