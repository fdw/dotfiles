# Dotfiles

## Content

### zshrc for [ZSH](http://zsh.org/)
* [Autojump](https://github.com/joelthelion/autojump)
* [Syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* [History-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
* [Powerline9k Theme](https://github.com/bhilburn/powerlevel9k)
* Autocompletion configuration
* Some nice aliases
	* `r` asks Autojump for the best directory and opens Ranger there
	* `g` is short for git
	* `v` opens Neovim

### vimrc/nvimrc for [Vim](http://www.vim.org/)/[Neovim](https://neovim.io/)
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
* [Bufferline](https://github.com/bling/vim-bufferline)
* [Indent Guidelines](https://github.com/nathanaelkane/vim-indent-guides)
* [Expand region](https://github.com/terryma/vim-expand-region)
* [EasyAlign](https://github.com/junegunn/vim-easy-align)
* Neovim is the default editor

### lesskey
* Same keymappings as vim (optimized for German keyboards)

### gitconfig
* Sensible configuration
* Useful aliases (contains assume, unstage and shortcuts for the most often used commands)
* needs to be configured with your own name and email

### tmux
* Sensible configuration

### i3wm
* Here, too, a sensible configuration

### ranger
* Sensible configuration
* Some useful keybindings
* Easy extraction and compression with [atool](http://www.nongnu.org/atool/)

### tig
* Nothing much

### htop
* styled for my taste

### [Rofi](https://davedavenport.github.io/rofi/)
* Solarized
* Uses a combi mode for drun, windows and ssh
* Sidebar offers each of these modi seperately

## Installation
	git clone https://github.com/fdw/dotfiles.git ~/.config
	cd .config/dotfiles
	make install

## Updating
	make update
