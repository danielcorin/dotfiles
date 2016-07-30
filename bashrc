PATH="~/bin:$PATH"
PATH="/usr/local/sbin:$PATH"

# Unlimited history
export HISTFILESIZE=
export HISTSIZE=

# GOPATH
export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"

if [ -f .bash_prompt ]; then
    . .bash_prompt
fi

if [ -f .bash_aliases ]; then
    . .bash_aliases
fi

if [ -f .uber_local ]; then
    . .uber_local
fi