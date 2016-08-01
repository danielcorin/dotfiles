# quick ones
alias ls="ls -G"
alias ll="ls -l"
alias l.="ls -ltrah"
alias c="clear"
alias h="history"
alias t="touch"
alias epoch="date +%s"
alias now="date -r"

alias bye='kill -9 $$'

# scripts
alias walls="python ~/dev/scripts/rename_walls.py"


# other
alias json="python -m json.tool"
alias serve="python -m SimpleHTTPServer"

alias hidehidden='defaults write com.apple.finder AppleShowAllFiles False; killall Finder'
alias showhidden='defaults write com.apple.finder AppleShowAllFiles True; killall Finder'


# functions

function s () {
    if [ $# -eq 0 ]; then
        subl .
    else
        subl $1
    fi
}


function mcd () {
  mkdir -p "$1" && cd "$1";
}

function cdl () {
    cd $1; ls;
}

function cdf () {
    currFolderPath=$( /usr/bin/osascript <<"    EOT"
        tell application "Finder"
            try
                set currFolder to (folder of the front window as alias)
            on error
                set currFolder to (path to desktop folder as alias)
            end try
            POSIX path of currFolder
        end tell
    EOT
    )
    echo "cd to \"$currFolderPath\""
    cd "$currFolderPath"
}

function lh () {
    open http://localhost:"$1"
}

# alias related
alias eal="subl ~/.bash_aliases"
alias sal=". ~/.bashrc; echo 'Sourced ~/.bashrc'"

# system
alias cal='cal | grep --before-context 6 --after-context 6 --color -e " $(date +%e)" -e "^$(date +%e)"'
alias bat='pmset -g batt | { read; read n status; echo "$status"; }'
alias epoch='date +%s'

# use ipython if available
function p() {
    ipython --version > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        python
    else
        ipython
    fi
}

function search_up () {
    proj_root=$(pwd -P 2>/dev/null || command pwd)
    while [ ! -e "$proj_root/$1" ]; do
      proj_root=${proj_root%/*}
      if [ -z "$proj_root" ]; then echo ""; return; fi
    done
    echo "$proj_root/$1"
}

function virtualenv_check () {
    VENV_DIR=$(search_up .venv);
    # .venv file is in the dir or a parent dir
    if [ ! -z $VENV_DIR ]; then
        # if an env is already active, check if we need to call `workon` at all
        if [ ! -z "$VIRTUAL_ENV" ]; then
            CUR_VENV=$(basename $VIRTUAL_ENV);
            VENV=$(cat $VENV_DIR);
            # if the active env if different from the .venv file, switch to the latter
            if [ "$VENV" != "$CUR_VENV" ]; then
                workon $VENV;
            fi
        # no env active
        else
            workon `cat $VENV_DIR`;
        fi
    else
        # code from virtualenvwrapper to deactivate an env
        type deactivate >/dev/null 2>&1
        if [ $? -eq 0 ]
        then
            deactivate
            unset -f deactivate >/dev/null 2>&1
        fi
    fi
}

function cd_hooks () {
    virtualenv_check
}

cd () {
    builtin cd "$@" && cd_hooks
}


# typos
alias pyhton=python
alias pythno=python
alias pythin=python
alias sl=ls

# git
alias gs='git status'
alias gc='git commit'
function gp() {
    git push -u $1 $2
}
