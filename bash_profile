# Load bash prompt.
[ -r ~/Projects/dotfiles/liquidprompt/liquidprompt ] && source ~/Projects/dotfiles/liquidprompt/liquidprompt

# Load dotfiles.
for f in {aliases,functions}; do
    # Load global.
    [ -r ~/.$f ] && source ~/.$f
    # Load OS.
    [ -r ~/.os/$f ] && source ~/.os/$f
done
unset f

# Load OS specific bash_profile, if present.
[ -r ~/.os/bash_profile ] && source ~/.os/bash_profile

# Load extra, if present.
[ -r ~/.extra ] && source ~/.extra
