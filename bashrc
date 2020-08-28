PATH="~/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH=/usr/local/share/python:$PATH

MANPATH="~/bin/man:$MANPATH"

# Unlimited history
export SHELL_SESSION_HISTORY=0
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='ls:history'
history -a

export BASH_SILENCE_DEPRECATION_WARNING=1

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

# not version controlled
if [ -f ~/.local ]; then
    . ~/.local
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

if [ -f ~/.inputrc ]; then
	. ~/.inputrc
fi

if [ -f ~/.macos ]; then
	. ~/.macos
fi

if [ -d ~/.bash_completion.d ]; then
  for file in ~/.bash_completion.d/*; do
    . $file
  done
fi

export PATH
export MANPATH

# import .bash_history, silently fail
# wget https://raw.githubusercontent.com/jcsalterego/historian/master/hist -O ~/bin/hist
hist import >/dev/null 2>&1

# to install
# /usr/local/opt/fzf/install
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
