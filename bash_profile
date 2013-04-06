# Load bash prompt.
[ -r ~/.bash_prompt ] && source ~/.bash_prompt

# Load dotfiles.
for f in {aliases,functions}; do
    # Load global.
    [ -r "~/.$f" ] && source "~/.$f"
    # Load OS.
    [ -r "~/.os/$f" ] && source "~/.os/$f"
done
unset f

# Load OS specific bash_profile, if present.
[ -r ~/.extra/bash_profile ] && source ~/.extra/bash_profile

# Load extra, if present.
[ -r ~/.extra ] && source ~/.extra