PATH="~/bin:$PATH"
PATH="/usr/local/sbin:$PATH"

# Unlimited history
export HISTFILESIZE=
export HISTSIZE=

# GOPATH
export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.uber_local ]; then
    . ~/.uber_local
fi

if [ -f ~/.git_completion ]; then
	. ~/.git_completion
fi

if [ -f ~/.virtualenv ]; then
	. ~/.virtualenv
fi

if [ -f ~/.mysql_config ]; then
	. ~/.mysql_config
fi
