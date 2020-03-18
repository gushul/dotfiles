SHELL = bash

default: packages git vim tmux base16_fzf fish

packages:
	./scripts/install_packages

git:
	./scripts/install_git

vim:
	./scripts/install_vim

tmux:
	./scripts/install_tmux

base16_fzf:
	./scripts/install_base16_fzf

fish:
	./scripts/install_fish
