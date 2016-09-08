PATH="~/bin:$PATH"
PATH="/usr/local/sbin:$PATH"

# Unlimited history
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoredups

# GOPATH
export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"

if [ -f ~/.prompt ]; then
    . ~/.prompt
fi

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# not version controlled
if [ -f ~/.locals ]; then
    . ~/.locals
fi

if [ -f ~/.git_completion ]; then
	. ~/.git_completion
fi

# not version controlled
if [ -f ~/.virtualenv ]; then
	. ~/.virtualenv
fi

if [ -f ~/.mysql_config ]; then
	. ~/.mysql_config
fi

if [ -f ~/.z.sh ]; then
	. ~/.z.sh
fi
