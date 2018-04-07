PATH="~/bin:$PATH"
PATH="/usr/local/sbin:$PATH"

MANPATH="~/bin/man:$MANPATH"

# Unlimited history
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth:erasedups

# GOPATH
export GOPATH="$HOME/gocode"
PATH="$PATH:$GOPATH/bin"

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

export PATH
export MANPATH

# import .bash_history, silently fail
# wget https://raw.githubusercontent.com/jcsalterego/historian/master/hist -O ~/bin/hist
hist import >/dev/null 2>&1

eval $(thefuck --alias tf)
