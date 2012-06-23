# Load external .files
for file in ~/.{bash_prompt,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using 'cd'
shopt -s cdspell

# Make vim the default editor
export EDITOR="vim"

# Setup Git
git config --global user.name "Edward Mann"
git config --global user.email "the@eddmann.com"

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion