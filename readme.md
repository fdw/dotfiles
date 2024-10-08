# Dotfiles

## Screenshot & Overview

![Screenshot](screenshot.png)

This repo contains dotfiles for my workspace that is focused on terminal based apps (neovim, yazi, zoxide) and a lightweight window manager (i3, rofi, polybar or sway, rofi, waybar). Everything is meant to integrate with everything else, starting from the theme: Solarized Dark.

## Detailed Content

### zshrc for [ZSH](http://zsh.org/)
* Plugins organized with [antidote](https://getantidote.github.io/)
* [Zoxide](https://github.com/ajeetdsouza/zoxide)
  * `y` asks Zoxide for the best directory and opens Yazi there, thanks to [yazi-zoxide-zsh](https://github.com/fdw/yazi-zoxide-zsh)
* Autocompletion configuration with [fzf](https://github.com/junegunn/fzf) thanks to [fzf-tab](https://github.com/Aloxaf/fzf-tab)
  * fzf also with [ripgrep](https://github.com/BurntSushi/ripgrep) for file and history search
* [Fast Syntax highlighting](https://github.com/zdharma/fast-syntax-highlighting)
* [History-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
* [Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [Powerline10k Theme](https://github.com/romkatv/powerlevel10k)
* Vim mode with [zsh-vim-mode](https://github.com/softmoth/zsh-vim-mode)
* Some nice aliases
  * `g` is short for git
  * `v` opens Neovim

### vimrc/nvimrc for [Neovim](https://neovim.io/)
* Based on [Kickstart](https://github.com/nvim-lua/kickstart.nvim)
* [Vim-Sneak](https://github.com/justinmk/vim-sneak)
* [Solarized Dark theme](https://github.com/maxmx03/solarized.nvim)
* Neovim is set as the default editor

### [i3wm](https://i3wm.org/)
* Here, too, a sensible configuration
* Solarized Dark theme
* Nice window and session modes with helpful status bar hints and shortcuts
* Polybar integration
* Rofi integration
* Nice workspace names with [workstyle](https://github.com/pierrechevalier83/workstyle)
* Works with multiple monitors by using [autorandr](https://github.com/phillipberndt/autorandr)
* Integrates [autotiling-rs](https://github.com/ammgws/autotiling-rs)

### [Polybar](https://github.com/jaagr/polybar/)
* Solarized Dark theme
* Styled after Powerline

### [Sway](https://swaywm.org/)
* Similar configuration to i3
* Waybar integration
* Rofi integration
* Nice workspace names with [workstyle](https://github.com/pierrechevalier83/workstyle)
* Works with multiple monitors by using [kanshi](https://sr.ht/~emersion/kanshi/)
* Integrates [autotiling](https://github.com/nwg-piotr/autotiling)

### [Rofi](https://davedavenport.github.io/rofi/)
* Solarized
* Uses a combi mode for drun and ssh
* Sidebar offers each of these modi seperately
* [clipster](https://github.com/mrichar1/clipster) & [roficlip](https://github.com/gilbertw1/roficlip)
* [rofimoji](https://github.com/fdw/rofimoji) for some emoji goodness
* [rofi-calc](https://github.com/svenstaro/rofi-calc)
* [rofi-rbw](https://github.com/fdw/rofi-rbw) to integrate with Bitwarden (via [rbw](https://github.com/doy/rbw))

### [yazi](https://github.com/sxyazi/yazi/)
* Sensible configuration
* Enable zoxide plugin

### [neomutt](https://neomutt.org/)
* Solarized, of course
* Vim-inspired shortcuts
* Set up to use [khard](https://github.com/scheibler/khard) as an address book

### [kitty](https://github.com/kovidgoyal/kitty)
* Solarized Dark theme
* Separate escape code for ctrl+enter that works with zsh's autosuggestions

### gitconfig
* Sensible configuration
* Useful aliases (contains assume, unstage and very short shortcuts for the most often used commands)
* Diffs with [difftastic](https://github.com/Wilfred/difftastic/) and [delta](https://github.com/dandavison/delta/)
* Needs to be configured with your own name and email
* Always ignores direnv files

### [Intellij](https://www.jetbrains.com/idea/) and its siblings
* Ideavim configuration matching the one for Neovim
* A nice color scheme based on Solarized Dark

### [Zathura](https://github.com/pwmt/zathura)
* Solarized colors

### lesskey
* Same keymappings as vim (optimized for German keyboards)

### tig
* Nothing much

### [btop](https://github.com/aristocratos/btop)
* Styled for my taste and needs

### [Dunst](https://github.com/dunst-project/dunst)
* Styled in solarized

## Installation
```
git clone --recursive https://github.com/fdw/dotfiles.git ~/.config/dotfiles
cd .config/dotfiles
make install
```

# Other helpful Programs
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [fd](https://github.com/sharkdp/fd)
