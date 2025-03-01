define check_installed
  @command -v $(1) &> /dev/null || (echo "$(2) is not installed, but is necessary" && exit 10)
endef

XDG_CONFIG_HOME ?= "${HOME}/.config"
XDG_DATA_HOME ?= "${HOME}/.local/share"

install: install-profile install-zsh install-nvim install-git install-less install-dircolors install-i3 install-polybar install-tig install-rofi install-kitty install-yazi install-zathura install-btop install-dunst

install-autorandr:
	$(call check_installed,autorandr,autorandr)
	@echo "Installing generic autorandr config"
	@mkdir -p "$(XDG_CONFIG_HOME)/autorandr/postswitch.d"
	@ln -s "${CURDIR}/autorandr/postswitch.d/10-background" "$(XDG_CONFIG_HOME)/autorandr/postswitch.d/10-background"
	@ln -s "${CURDIR}/autorandr/postswitch.d/10-polybar" "$(XDG_CONFIG_HOME)/autorandr/postswitch.d/10-polybar"

install-btop:
	@echo "Installing btop"
	@ln -fs "${CURDIR}/btop.conf" "${HOME}/.config/btop/btop.conf"

install-dircolors:
	@echo "Installing .dir_colors"
	@ln -fs "${CURDIR}/dircolors/dircolors.ansi-universal" "${HOME}/.dir_colors"

install-dunst:
	@echo "Installing dunstrc"
	@ln -fs "${CURDIR}/dunstrc" "$(XDG_CONFIG_HOME)/dunst/dunstrc"

install-git:
	$(call check_installed,git,git)
	$(call check_installed,delta,git-delta)
	$(call check_installed,difft,git-difftastic)
	$(call check_installed,git-lfs,git-lfs)
	@echo "Installing .gitconfig"
	@mkdir -p "$(XDG_CONFIG_HOME)/git"
	@ln -fs "${CURDIR}/git/config" "$(XDG_CONFIG_HOME)/git/config"
	@ln -fs "${CURDIR}/git/ignore" "$(XDG_CONFIG_HOME)/git/ignore"

install-i3: install-polybar install-rofi
	$(call check_installed,clipster,clipster)
	$(call check_installed,roficlip,roficlip)
	$(call check_installed,rofi-rbw,rofi-rbw)
	$(call check_installed,rofimoji,rofimoji)
	$(call check_installed,xss-lock,xss-lock)
	$(call check_installed,xset,xorg-xset)
	$(call check_installed,autotiling-rs,autotiling-rs)
	$(call check_installed,autorandr,autorandr)
	$(call check_installed,feh,feh)
	@echo "Installing i3 config"
	@mkdir -p "$(XDG_CONFIG_HOME)/i3/"
	@ln -fs "${CURDIR}/i3/config" "$(XDG_CONFIG_HOME)/i3/config"
	@ln -fs "${CURDIR}/i3/autorandr-postswitch" "$(XDG_CONFIG_HOME)/autorandr/postswitch"

install-intellij: install-nvim
	@echo "Installing ideavimrc"
	@mkdir -p "$(XDG_CONFIG_HOME)/ideavim"
	@ln -fs "${CURDIR}/intellij/ideavimrc" "$(XDG_CONFIG_HOME)/ideavim/ideavimrc"

install-kitty:
	@echo "Installing kitty config"
	@mkdir -p "$(XDG_CONFIG_HOME)/kitty"
	@ln -fs "${CURDIR}/kitty.conf" "$(XDG_CONFIG_HOME)/kitty/kitty.conf"

install-less:
	@echo "Installing .lesskey"
	@ln -fs "${CURDIR}/lesskey" "${HOME}/.lesskey"
	@lesskey "${HOME}/.lesskey"

install-neomutt:
	$(call check_installed,neomutt,neomutt)
	$(call check_installed,msmtp,msmtp)
	$(call check_installed,w3m,w3m)
	@echo "Installing Neomutt rc"
	@mkdir -p "$(XDG_CONFIG_HOME)/neomutt"
	@ln -fs "${CURDIR}/neomutt/neomuttrc" "$(XDG_CONFIG_HOME)/neomutt/neomuttrc"
	@ln -fs "${CURDIR}/neomutt/gpg.rc" "$(XDG_CONFIG_HOME)/neomutt/gpg.rc"
	@ln -fs "${CURDIR}/neomutt/colors/mutt-colors-solarized-dark-16.muttrc" "$(XDG_CONFIG_HOME)/neomutt/theme.rc"
	@echo "Remember to put your information in $(XDG_CONFIG_HOME)/neomutt/account.rc"
	@mkdir -p "${XDG_CONFIG_HOME}/khard"
	@ln -fs "${CURDIR}/neomutt/khard.conf" "${XDG_CONFIG_HOME}/khard/khard.conf"

install-nvim:
	$(call check_installed,nvim,neovim)
	@echo "Installing Neovim initrc"
	@mkdir -p "$(XDG_CONFIG_HOME)/nvim"
	@ln -fs "${CURDIR}/nvim/init.lua" "$(XDG_CONFIG_HOME)/nvim/init.lua"

install-polybar:
	$(call check_installed,polybar,polybar)
	@echo "Installing polybar"
	@mkdir -p "$(XDG_CONFIG_HOME)/polybar/"
	@ln -fs "${CURDIR}/polybar/config.ini" "$(XDG_CONFIG_HOME)/polybar/config.ini"
	@ln -fs "${CURDIR}/polybar/launch.sh" "$(XDG_CONFIG_HOME)/polybar/launch.sh"

install-profile:
	@echo "Installing .profile"
	@ln -ffs "${CURDIR}/profile" "${HOME}/.profile"

install-rofi:
	$(call check_installed,rofi,rofi)
	@echo "Installing rofi/config"
	@mkdir -p "$(XDG_CONFIG_HOME)/rofi"
	@ln -fs "${CURDIR}/rofi.rasi" "$(XDG_CONFIG_HOME)/rofi/config.rasi"
	@ln -fs "${CURDIR}/rofimoji.rc" "$(XDG_CONFIG_HOME)/rofimoji.rc"

install-sway: install-waybar install-workstyle
	$(call check_installed,sway,sway)
	$(call check_installed,wpaperd,wpaperd)
	$(call check_installed,kanshi,kanshi)
	@echo "Installing sway config"
	@mkdir -p "$(XDG_CONFIG_HOME)/sway"
	@ln -fs "${CURDIR}/sway/sway" "$(XDG_CONFIG_HOME)/sway/config"
	@mkdir -p "$(XDG_CONFIG_HOME)/wpaperd"
	@ln -fs "${CURDIR}/sway/wallpaper.toml" "$(XDG_CONFIG_HOME)/wpaperd/wallpaper.toml"

install-tig:
	@echo "Installing .tigrc"
	@ln -fs "${CURDIR}/tigrc" "${HOME}/.tigrc"

install-waybar:
	$(call check_installed,waybar,waybar)
	@echo "Installing waybar config"
	@mkdir -p "$(XDG_CONFIG_HOME)/waybar"
	@ln -fs "${CURDIR}/waybar/config" "$(XDG_CONFIG_HOME)/waybar/config"
	@ln -fs "${CURDIR}/waybar/style.css" "$(XDG_CONFIG_HOME)/waybar/style.css"

install-workstyle:
	$(call check_installed,workstyle,workstyle)
	@echo "Installing workstyle config"
	@mkdir -p "$(XDG_CONFIG_HOME)/workstyle"
	@ln -fs "${CURDIR}/workstyle.toml" "$(XDG_CONFIG_HOME)/workstyle/config.toml"

install-yay:
	$(call check_installed,yay,yay)
	@echo "Installing yay config"
	@mkdir -p "$(XDG_CONFIG_HOME)/yay"
	@ln -fs "${CURDIR}/yay.json" "$(XDG_CONFIG_HOME)/yay/config.json"

install-yazi:
	$(call check_installed,yazi,yazi)
	@echo "Installing yazi config"
	@mkdir -p "$(XDG_CONFIG_HOME)/yazi"
	@ln -fs "${CURDIR}/yazi/yazi.toml" "$(XDG_CONFIG_HOME)/yazi/yazi.toml"
	@ln -fs "${CURDIR}/yazi/init.lua" "$(XDG_CONFIG_HOME)/yazi/init.lua"
	@ln -fs "${CURDIR}/yazi/keymap.toml" "$(XDG_CONFIG_HOME)/yazi/keymap.toml"

install-zathura:
	$(call check_installed,zathura,zahtura)
	@echo "Installing zathura config"
	@mkdir -p "${XDG_CONFIG_HOME}/zathura"
	@ln -fs "${CURDIR}/zathurarc" "${XDG_CONFIG_HOME}/zathura/zathurarc"

install-zsh: install-dircolors install-git
	$(call check_installed,exa,exa)
	@echo "Installing .zshrc"
	@ln -fs "${CURDIR}/zsh/rc" "${HOME}/.zshrc"
	@ln -fs "${CURDIR}/zsh/env" "${HOME}/.zshenv"
	@mkdir "$(XDG_DATA_HOME)/zsh"
	@ln -fs "${CURDIR}/zsh/aliases.zsh" "$(XDG_DATA_HOME)/zsh/aliases.zsh"
	@ln -fs "${CURDIR}/zsh/p10k.zsh" "$(XDG_DATA_HOME)/zsh/p10k.zsh"
	@mkdir "$(XDG_DATA_HOME)/zsh/completions"
	@if [ ! -f "$(XDG_DATA_HOME)/zsh/antidote/antidote.zsh" ]; then \
		git clone https://github.com/mattmc3/antidote.git $(XDG_DATA_HOME)/zsh/antidote; \
	fi
	@/bin/zsh -c "source $(XDG_DATA_HOME)/zsh/antidote/antidote.zsh && antidote bundle < ${CURDIR}/zsh/plugins.rc > $(XDG_DATA_HOME)/zsh/plugins.zsh"
	@mkdir "$(XDG_DATA_HOME)/zsh/completions"
