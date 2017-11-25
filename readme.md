# Dotfiles

## Content

### zshrc for [ZSH](http://zsh.org/)
* Autocompletion configuration
* Plugins organized with [zgen](https://github.com/tarjoilija/zgen)
* [Autojump](https://github.com/joelthelion/autojump)
* [fzf](https://github.com/junegunn/fzf) with [ripgrep](https://github.com/BurntSushi/ripgrep) for file and history search
* [Fast Syntax highlighting](https://github.com/zdharma/fast-syntax-highlighting)
* [History-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
* [Powerline9k Theme](https://github.com/bhilburn/powerlevel9k)
* Some nice aliases
	* `r` asks Autojump for the best directory and opens Ranger there
	* `g` is short for git
	* `v` opens Neovim
* Supports [Direnv](https://github.com/direnv/direnv)

### vimrc/nvimrc for [Neovim](https://neovim.io/)
* Keymapping for German keyboards
* Continous undo
* Plugins organized with [Vim-Plug](https://github.com/junegunn/vim-plug)
* [fzf](https://github.com/junegunn/fzf) [for vim](https://github.com/junegunn/fzf.vim)
* [Vim-Sneak](https://github.com/justinmk/vim-sneak)
* [Vim-Surround](https://github.com/tpope/vim-surround)
* [Startify](https://github.com/mhinz/vim-startify)
* [Devicons](https://github.com/ryanoasis/vim-devicons)
* [Airline](https://github.com/bling/vim-airline)
* [Bufferline](https://github.com/bling/vim-bufferline)
* [Indent Guidelines](https://github.com/nathanaelkane/vim-indent-guides)
* [Expand region](https://github.com/terryma/vim-expand-region)
* [EasyAlign](https://github.com/junegunn/vim-easy-align)
* [Solarized Dark theme](https://github.com/lifepillar/vim-solarized8)
* Neovim is set as the default editor

### [i3wm](https://i3wm.org/)
* Here, too, a sensible configuration
* Solarized Dark theme
* Nice window and session modes with helpful status bar hints and shortcuts
* Rofi integration

### [Rofi](https://davedavenport.github.io/rofi/)
* Solarized
* Uses a combi mode for drun, windows and ssh
* Sidebar offers each of these modi seperately

### [ranger](http://ranger.nongnu.org/)
* Sensible configuration
* Some useful keybindings
* Easy extraction and compression with [atool](http://www.nongnu.org/atool/)
* [Devicons](https://github.com/alexanderjeurissen/ranger_devicons/)

### gitconfig
* Sensible configuration
* Useful aliases (contains assume, unstage and shortcuts for the most often used commands)
* needs to be configured with your own name and email
* Always ignores direnv files

### lesskey
* Same keymappings as vim (optimized for German keyboards)

### tmux
* Sensible configuration

### tig
* Nothing much

### htop
* styled for my taste

## Installation
	`git clone --recursive https://github.com/fdw/dotfiles.git ~/.config/dotfiles`
	cd .config/dotfiles
	make install

## Updating
	make update

# Helpful Programs
* [fzf](https://github.com/junegunn/fzf)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [rofi](https://github.com/DaveDavenport/rofi)
	* [clipster](https://github.com/mrichar1/clipster) & [roficlip](https://github.com/gilbertw1/roficlip)
	* [rofi-pass](https://github.com/carnager/rofi-pass)
	* [rofimoji](https://github.com/fdw/rofimoji)
