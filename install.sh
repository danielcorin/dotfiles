#!/bin/bash


printf 'checking for dotfiles...'
if [ -d "$HOME/.dotfiles" ]; then
	printf "dotfiles already downloaded\n"
else
	printf "downloading dotfiles..."
	git clone git@github.com:danielcorin/dotfiles.git "$HOME/.dotfiles"
	printf "dotfiles downloaded\n"
fi

printf "checking rcm installation..."
which rcup > /dev/null 2>&1

if [ $? -eq 1 ]; then
	if [ "$(uname)" = "Darwin" ]; then
		brew tap thoughtbot/formulae
		brew install rcm
		printf "installed rcm\n"
	else
		sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
		sudo apt-get update
		sudo apt-get install rcm
		printf "installed rcm\n"
	fi
else
	printf "rcm already installed\n"
fi

printf "installing dotfiles..."
rcup -x install.sh
printf "dotfiles installed\n"

printf "sourcing bashrc..."
. ~/.bashrc
printf "bashrc sourced\n"
