define check_installed
  @command -v $(1) &> /dev/null || (echo "$(2) is not installed, but is necessary" && exit 10)
endef

XDG_CONFIG_HOME ?= "${HOME}/.config"
XDG_DATA_HOME ?= "${HOME}/.local/share"

install: install-profile install-zsh install-nvim install-git install-less install-dircolors install-i3 install-polybar install-ranger install-tig install-htop install-rofi install-kitty install-zathura

install-dircolors:
	@echo "Installing .dir_colors"
	@ln -fs "${CURDIR}/dircolors/dircolors.ansi-universal" "${HOME}/.dir_colors"

install-git:
	$(call check_installed,git,git)
	$(call check_installed,diff-so-fancy,diff-so-fancy)
	$(call check_installed,git-lfs,git-lfs)
	@echo "Installing .gitconfig"
	@mkdir -p "$(XDG_CONFIG_HOME)/git"
	@ln -fs "${CURDIR}/git/config" "$(XDG_CONFIG_HOME)/git/config"
	@ln -fs "${CURDIR}/git/ignore" "$(XDG_CONFIG_HOME)/git/ignore"

install-htop:
	$(call check_installed,htop,htop)
	@echo "Installing htoprc"
	@mkdir -p "$(XDG_CONFIG_HOME)/htop"
	@ln -fs "${CURDIR}/htoprc" "$(XDG_CONFIG_HOME)/htop/htoprc"

install-i3: install-polybar install-rofi
	$(call check_installed,clipster,clipster)
	$(call check_installed,roficlip,roficlip)
	$(call check_installed,xss-lock,xss-lock)
	$(call check_installed,xset,xorg-xset)
	$(call check_installed,autotiling,autotiling)
	@echo "Installing i3 config"
	@mkdir -p "$(XDG_CONFIG_HOME)/i3/"
	@ln -fs "${CURDIR}/i3/config" "$(XDG_CONFIG_HOME)/i3/config"

install-intellij: install-nvim
	@echo "Installing ideavimrc"
	@ln -fs "${CURDIR}/nvim/ideavimrc" "${HOME}/.ideavimrc"

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
	$(call check_installed,fzf,fzf)
	$(call check_installed,rg,ripgrep)
	@echo "Installing Neovim initrc"
	@mkdir -p "$(XDG_CONFIG_HOME)/nvim"
	@ln -fs "${CURDIR}/nvim/init.vim" "$(XDG_CONFIG_HOME)/nvim/init.vim"
	@ln -fs "${CURDIR}/nvim/common.vim" "$(XDG_CONFIG_HOME)/nvim/common.vim"
	@ln -fs "${CURDIR}/nvim/keys.vim" "$(XDG_CONFIG_HOME)/nvim/keys.vim"
	@ln -fs "${CURDIR}/nvim/nvim.vim" "$(XDG_CONFIG_HOME)/nvim/nvim.vim"
	@ln -fs "${CURDIR}/nvim/plugins.vim" "$(XDG_CONFIG_HOME)/nvim/plugins.vim"
	@ln -fs "${CURDIR}/nvim/filetypes.vim" "$(XDG_CONFIG_HOME)/nvim/filetypes.vim"
	@if [ ! -f "$(XDG_DATA_HOME)/nvim/site/autoload/plug.vim" ]; then \
		curl -fLo "$(XDG_DATA_HOME)/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi

install-polybar:
	$(call check_installed,polybar,polybar)
	@echo "Installing polybar"
	@mkdir -p "$(XDG_CONFIG_HOME)/polybar/"
	@ln -fs "${CURDIR}/polybar/config" "$(XDG_CONFIG_HOME)/polybar/config"
	@ln -fs "${CURDIR}/polybar/launch.sh" "$(XDG_CONFIG_HOME)/polybar/launch.sh"

install-profile:
	@echo "Installing .profile"
	@ln -ffs "${CURDIR}/profile" "${HOME}/.profile"

install-ranger:
	$(call check_installed,ranger,ranger)
	$(call check_installed,w3m,w3m)
	$(call check_installed,aunpack,atools)
	@echo "Installing .config/ranger/rc.conf"
	@mkdir -p "$(XDG_CONFIG_HOME)/ranger/plugins"
	@ln -fs "${CURDIR}/ranger/rc.conf" "$(XDG_CONFIG_HOME)/ranger/rc.conf"
	@ln -fs "${CURDIR}/ranger/commands" "$(XDG_CONFIG_HOME)/ranger/commands.py"
	@ln -fs "${CURDIR}/ranger/rifle.conf" "$(XDG_CONFIG_HOME)/ranger/rifle.conf"
	@ln -fs "${CURDIR}/ranger/autojump/autojump.py" "$(XDG_CONFIG_HOME)/ranger/plugins/autojump.py"
	@ln -fs "${CURDIR}/ranger/devicons/devicons.py" "$(XDG_CONFIG_HOME)/ranger/plugins/devicons.py"
	@ln -fs "${CURDIR}/ranger/devicons/__init__.py" "$(XDG_CONFIG_HOME)/ranger/plugins/devicons_linemode.py"

install-rofi:
	$(call check_installed,rofi,rofi)
	@echo "Installing rofi/config"
	@mkdir -p "$(XDG_CONFIG_HOME)/rofi"
	@ln -fs "${CURDIR}/rofi" "$(XDG_CONFIG_HOME)/rofi/config"
	@ln -fs "${CURDIR}/rofimoji.rc" "$(XDG_CONFIG_HOME)/rofimoji.rc"

install-tig:
	@echo "Installing .tigrc"
	@ln -fs "${CURDIR}/tigrc" "${HOME}/.tigrc"

install-yay:
	$(call check_installed,yay,yay)
	@echo "Installing yay config"
	@mkdir -p "$(XDG_CONFIG_HOME)/yay"
	@ln -fs "${CURDIR}/yay.json" "$(XDG_CONFIG_HOME)/yay/config.json"

install-zathura:
	$(call check_installed,zathura,zahtura)
	@echo "Installing zathura config"
	@mkdir -p "${XDG_CONFIG_HOME}/zathura"
	@ln -fs "${CURDIR}/zathurarc" "${XDG_CONFIG_HOME}/zathura/zathurarc"

install-zsh: install-dircolors
	$(call check_installed,antibody,antibody)
	@echo "Installing .zshrc"
	@ln -fs "${CURDIR}/zsh/rc" "${HOME}/.zshrc"
	@ln -fs "${CURDIR}/zsh/env" "${HOME}/.zshenv"
	@ln -fs "${CURDIR}/zsh/aliases.zsh" "$(XDG_DATA_HOME)/zsh/aliases.zsh"
	@ln -fs "${CURDIR}/zsh/p10k.zsh" "$(XDG_DATA_HOME)/zsh/p10k.zsh"
	@antibody bundle < ${CURDIR}/zsh/plugins.rc > $(XDG_DATA_HOME)/zsh/antibody/plugins.sh
