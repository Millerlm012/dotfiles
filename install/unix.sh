#/bin/bash

# cloning repo to /tmp
if [ -d /tmp/dotfiles ]; then
	rm -rf /tmp/dotfiles
fi
git clone https://github.com/Millerlm012/dotfiles /tmp/dotfiles

# making config dir and sub dirs
if [ ! -d ~/.config ]; then
	mkdir ~/.config
fi

cp -r /tmp/dotfiles/.config/alacritty ~/.config
cp -r /tmp/dotfiles/.config/tmux ~/.config

# source tmux conf
tmux source ~/.config/tmux/tmux.conf

if [ ! -d ~/.config/nvim ]; then
	# git clone https://github.com/LazyVim/starter ~/.config/nvim
	cp -r /tmp/dotfiles/.config/nvim ~/.config
else
	echo "nvim dir already exists, creating a backup and installing lazyvim"
	current_date_time=$(date +"%Y%m%d_%T")
	if [ -d ~/.config/nvim ]; then
		mv ~/.config/nvim{,_$current_date_time.bak}
	fi
	if [ -d ~/.local/share/nvim ]; then
		mv ~/.local/share/nvim{,_$current_date_time.bak}
	fi
	if [ -d ~/.local/state/nvim ]; then
		mv ~/.local/state/nvim{,_$current_date_time.bak}
	fi
	if [ -d ~/.cache/nvim ]; then
		mv ~/.cache/nvim{,_$current_date_time.bak}
	fi
	# git clone https://github.com/LazyVim/starter ~/.config/nvim
	cp -r /tmp/dotfiles/.config/nvim ~/.config
fi
