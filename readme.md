# Dotfiles

## Content

### zshrc
* [Autojump](https://github.com/joelthelion/autojump)
* [Syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* Autocompletion configuration
* a pretty two-line prompt

### vimrc
* Keymapping for German keyboards
* Continous undo
* Plugins organized with [NeoBundle](https://github.com/Shougo/neobundle.vim)
* [Unite](https://github.com/Shougo/unite.vim) configured for async file search and a yank history
* [Unite outline](https://github.com/Shougo/unite-outline) for showing an outline with ctags in Unite
* [Vim-Sneak](https://github.com/justinmk/vim-sneak)
* [Gundo](https://github.com/sjl/gundo.vim/)
* [Vim-Surround](https://github.com/tpope/vim-surround)
* [Indent Textobject](https://github.com/kana/vim-textobj-indent/)
* [Startify](https://github.com/mhinz/vim-startify)
* [Airline](https://github.com/bling/vim-airline)
* [Indent Guidelines](https://github.com/nathanaelkane/vim-indent-guides)

### lesskey
* Same keymappings as vim (optimized for German keyboards)

### gitconfig (needs to be configured)
* Sensible configuration
* Useful aliases

### tmux
* Sensible configuration

### i3wm
* Not so sensible configuration

### ranger
* Sensible configuration
* Some useful keybindings

## Installation
	git clone https://github.com/fdw/dotfiles.git ~/.config
	cd .config/dotfiles
	make install

## Updating
	make update
