# Dotfiles

## Content

### zshrc
* [Autojump](https://github.com/joelthelion/autojump)
* [Syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* [History-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
* [Powerline9k Theme](https://github.com/bhilburn/powerlevel9k)
* Autocompletion configuration

### vimrc
* Keymapping for German keyboards
* Continous undo
* Plugins organized with [Vim-Plug](https://github.com/junegunn/vim-plug)
* [CtrlP](https://github.com/ctrlpvim/ctrlp.vim)
* [CtrlP Extensions](https://github.com/sgur/ctrlp-extensions.vim)
* [Vim-Sneak](https://github.com/justinmk/vim-sneak)
* [Vim-Surround](https://github.com/tpope/vim-surround)
* [Startify](https://github.com/mhinz/vim-startify)
* [Devicons](https://github.com/ryanoasis/vim-devicons)
* [Airline](https://github.com/bling/vim-airline)
* [Indent Guidelines](https://github.com/nathanaelkane/vim-indent-guides)
* [Expand region](https://github.com/terryma/vim-expand-region)

### Neovim init.vim
* Same as the vimrc, but based on Neovim's defaults and directories
* Neovim is the default editor

### lesskey
* Same keymappings as vim (optimized for German keyboards)

### gitconfig (needs to be configured)
* Sensible configuration
* Useful aliases (contains assume, unstage)

### tmux
* Sensible configuration

### i3wm
* Here, too, a sensible configuration

### ranger
* Sensible configuration
* Some useful keybindings

### tig
* Nothing much

### htop
* styled for my taste

## Installation
	git clone https://github.com/fdw/dotfiles.git ~/.config
	cd .config/dotfiles
	make install

## Updating
	make update
