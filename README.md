# Eric Perko's dotfiles

## Install packages:

	sudo apt-get install vim vim-gtk git tig git-gui git-svn gitk python-pip \
	xmonad suckless-tools xmobar dwm dmenu ubuntu-restricted-extras rxvt-unicode tmux \
	byobu trayer libghc6-xmonad-contrib-dev scrot cabal-install xclip \
	ack build-essential gufw keychain chrony openssh-server 

## Dotfiles installation

	sudo pip install dotfiles
	mkdir ~/repos/dotfiles
	git clone git@github.com:ericperko/dotfiles.git
	dotfiles -s -R ~/repos/dotfiles


