#!/bin/bash
set -vex

for i in dunst gdb ranger spotifyd suckless sxhkd tmux zsh nvim; do
	[[ ! -L ~/.config/${i} ]] && ln -sf $(pwd)/${i} ~/.config/${i}
done

for i in xinitrc zshenv gitconfig; do
	[[ ! -L ~/.config/${i} ]] && ln -sf $(pwd)/${i} ~/.${i}
done
