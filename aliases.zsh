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
alias take='mcd'

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
alias gpo='git pull origin main';
alias ggm='git checkout main';
alias gs='git status';
alias gc='git commit';
alias gb='git branch';
alias ga='git add -A';
alias gd='git diff';
alias gl='git log';
alias gb='git branch';
alias gcm='git checkout main';
alias gbd='git branch -D';
alias ggo='git checkout -B'
alias gco='git checkout';
alias grbm='git rebase main';
alias gsa="git stash apply"
alias glg='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset'\'' --abbrev-commit'
alias grt='git commit --allow-empty -m "retest"'

alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'

function ugh () {
    branch=$(git rev-parse --abbrev-ref HEAD)
    git checkout main
    git pull origin main
    git reset --hard origin/main
    git checkout $branch
}

function push {
    git push origin $(git rev-parse --abbrev-ref HEAD)
}

function create {
	branch=$(git rev-parse --abbrev-ref HEAD)
	git commit -am "[$branch] $1"
}

# git interactive checkout files
alias gic="git status --porcelain | yank | xargs git checkout"

# git interactive checkout branch
function gg () {
	git branch | fzf | sed 's/\* //g' | xargs git checkout
}

alias 1on1="t ls @1on1"
alias dhide='defaults write com.apple.finder CreateDesktop false
killall Finder'
alias dshow='defaults write com.apple.finder CreateDesktop true
killall Finder'

# nb
alias n='nb'

function sw() {
    nb notebooks --no-color | fzf | xargs nb use
}

function na() {
	if [[ $# -lt 2 ]] ; then
		echo "nb add and edit | Adds an new note in the default editor."
		echo "Usage: na <title> <first line of note>"
	else
		local title="$1"
		shift
		declare -a first_line_of_note=("$@")
		echo "# ${first_line_of_note[@]}" | nb add -f "$title" --edit
	fi
}

function ne() {
	if [[ $# -lt 1 ]] ; then
		echo "nb edit | Usage: ne <index number or filename>"
	else
		nb edit "$1"
	fi
}

function np() {
	if [[ $# -lt 1 ]] ; then
		echo "nb peek | Usage: np <index number or filename>"
	else
		nb peek "$1"
	fi
}

function nd() {
	if [[ $# -lt 1 ]] ; then
		echo "nb delete Usage: nd <index number or filename>"
	else
		nb delete "$1"
	fi
}

function ns() {
	if [[ $# -lt 1 ]] ; then
		echo "nb search | Usage: ns <search terms>"
	else
		nb search -a "$@"
	fi
}

function no() {
	local path_to_notebooks=~/.nb
	cd $path_to_notebooks
	local latest_notebook=$(ls -1t | head -n1)
	cd $latest_notebook
	ls -l
}

function nu() {
	if [[ $# -lt 1 ]] ; then
		echo "nb use | Usage: ns use <notebook>"
	else
		nb use "$1"
	fi
}

function nbtags() {
	(cd ~/.nb; rg --no-filename --no-line-number "#\w+" | tr ' ' '\n' | sort -u)
}

function nt() {
	nbtags | fzf | xargs nb search -a --no-color
}

function nq() {
	nb search "$@" --list --path --all | grep -v '.index' | fzf --no-mouse --preview 'bat --color "always" {}' | xargs code
}
