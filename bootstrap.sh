#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.config

# From https://github.com/sjl/dotfiles/blob/master/bin/bootstrap.sh
function ensure_link {
	    test -L "$HOME/$2" || ln -s "$DOTFILES_DIR/$1" "$HOME/$2"
}

# Vim
ensure_link "vim"           ".vim"
ensure_link "vimrc"         ".vimrc"

# Zsh & Prezto
ensure_link "zsh/zshrc"     ".zshrc"
ensure_link "zsh/zlogin"    ".zlogin"
ensure_link "zsh/zpreztorc" ".zpreztorc"

# Git
ensure_link "git/gitconfig" ".gitconfig"
ensure_link "git/gitignore_global" ".gitignore_global"

# Tmux
ensure_link "tmux.conf"     ".tmux.conf"

# CTags
ensure_link "ctags"         ".ctags"

# Ack
ensure_link "ackrc"         ".ackrc"
