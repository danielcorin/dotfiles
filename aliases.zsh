# quick ones
alias ls="ls -G";
alias l="exa";
alias ll="l -l";
alias l.="l -lrah";
alias h="history";
alias t="touch";
alias o="open .";
alias c="code";
alias sl="ls";
alias dfiles="code ~/.dotfiles"
alias t="todo.sh"
alias sal=". ~/.zshrc"

function mcd () {
    mkdir -p "$1" && cd "$1";
}

function now () {
    if [ $# -eq 0 ]; then
        date +%s;
    else
        date -r $1;
    fi
}

# fasd aliases
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

function docker_reset () {
  docker kill $(docker ps -q)
  docker system prune
  docker volume rm `docker volume ls -qf dangling=true`
}
function dock () {
  docker exec -it $1 /bin/bash
}
alias dwa="watch \"docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.ID}}'\""
alias dlf="docker logs -f"
alias dps="docker ps"

function port () { lsof -i tcp:$1 }

# git
alias gp='git pull';
alias gpo='git pull origin master';
alias ggm='git checkout master';
alias gs='git status';
alias gc='git commit';
alias gb='git branch';
alias ga='git add -A';
alias gd='git diff';
alias gl='git log';
alias gb='git branch';
alias gcm='git checkout master';
alias gbd='git branch -D';
alias ggo='git checkout -B'
alias gco='git checkout';
alias grbm='git rebase master';
alias gsa="git stash apply"
alias glg='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset'\'' --abbrev-commit'

alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'

function ugh () {
    branch=$(git rev-parse --abbrev-ref HEAD)
    git checkout master
    git pull origin master
    git reset --hard origin/master
    git checkout $branch
}

function push {
    git push origin $(git rev-parse --abbrev-ref HEAD)
}

# git interactive checkout files
alias gic="git status --porcelain | yank | xargs git checkout"

# git interactive checkout branch
function gg () {
	git branch | tr -d '* ' | yank | xargs git checkout
}

alias 1on1="t ls @1on1"
alias dhide='defaults write com.apple.finder CreateDesktop false
killall Finder'
alias dshow='defaults write com.apple.finder CreateDesktop true
killall Finder'
