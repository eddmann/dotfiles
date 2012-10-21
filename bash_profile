# Add '~/.bin' to the '$PATH'
export PATH="$HOME/.bin:$PATH"

# Load external dotfiles
for f in ~/.{bash_prompt,aliases,functions}; do
  [ -r "$f" ] && source "$f"
done
unset f

# Case-insensitive globbing
shopt -s nocaseglob

# Auto-correct typos in path names when using 'cd'
shopt -s cdspell

# Make vim the default editor
export EDITOR="vim"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion, if available
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Add OS specific bash_profile, if present
[ -f ~/.bash_profile_os ] && source ~/.bash_profile_os