## .files

.extras OSX example

~~~ .bash
P=$PATH
P="$(brew --prefix coreutils)/libexec/gnubin:$P"
P="/usr/local/bin:$P"
P="$HOME/bin:$P"
P="$P:$HOME/.rvm/bin"

M=$MANPATH
M="$(brew --prefix coreutils)/libexec/gnuman:$M"

export PATH="$P"
export MANPATH="$M"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM
~~~