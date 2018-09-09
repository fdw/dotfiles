define check_installed
  @command -v $(1) &> /dev/null || (echo "$(2) is not installed, but is necessary" && exit 10)
endef

install: install-zsh install-nvim install-git install-less install-dircolors install-i3 install-ranger install-tig install-htop install-rofi install-urxvt

install-aptitude:
	@echo "Installing .aptitude/config"
	@mkdir -p ${HOME}/.aptitude
	@ln -fs ${CURDIR}/aptitude ${HOME}/.aptitude/config

install-dircolors:
	@echo "Installing .dir_colors"
	@ln -fs ${CURDIR}/dircolors/dircolors.ansi-universal ${HOME}/.dir_colors

install-git:
	$(call check_installed,git,git)
	@echo "Installing .gitconfig"
	@mkdir -p ${XDG_CONFIG_HOME}/git
	@ln -fs ${CURDIR}/git/config ${XDG_CONFIG_HOME}/git/config
	@ln -fs ${CURDIR}/git/ignore ${XDG_CONFIG_HOME}/git/ignore

install-htop:
	$(call check_installed,htop,htop)
	@echo "Installing htoprc"
	@mkdir -p "${XDG_CONFIG_HOME}/htop"
	@ln -fs "${CURDIR}/htoprc" "${XDG_CONFIG_HOME}/htop/htoprc"

install-i3: install-polybar
	$(call check_installed,rofi,rofi)
	$(call check_installed,rofi-pass,rofi-pass)
	$(call check_installed,clipster,clipster)
	$(call check_installed,roficlip,roficlip)
	@echo "Installing .config/i3/config"
	@mkdir -p ${XDG_CONFIG_HOME}/i3/
	@ln -fs ${CURDIR}/i3/config ${XDG_CONFIG_HOME}/i3/config

install-kitty:
	@echo "Installing kitty config"
	@mkdir -p "${XDG_CONFIG_HOME}/kitty"
	@ln -fs ${CURDIR}/kitty.conf ${XDG_CONFIG_HOME}/kitty/kitty.conf

install-less:
	@echo "Installing .lesskey"
	@ln -fs ${CURDIR}/lesskey ${HOME}/.lesskey
	@lesskey ${HOME}/.lesskey

install-neomutt:
	$(call check_installed,neomutt,neomutt)
	$(call check_installed,msmtp,msmtp)
	@echo "Installing Neomutt rc"
	@mkdir -p "${XDG_CONFIG_HOME}/neomutt"
	@ln -fs "${CURDIR}/neomutt/neomuttrc" ${XDG_CONFIG_HOME}/neomutt/neomuttrc
	@ln -fs "${CURDIR}/neomutt/gpg.rc" ${XDG_CONFIG_HOME}/neomutt/gpg.rc
	@ln -fs "${CURDIR}/neomutt/colors/mutt-colors-solarized-dark-16.muttrc" ${XDG_CONFIG_HOME}/neomutt/theme.rc
	@echo "Remember to put your information in ${CDG_CONFIG_HOME}/neomutt/account.rc"

install-nvim:
	$(call check_installed,nvim,neovim)
	$(call check_installed,fzf,fzf)
	$(call check_installed,rg,ripgrep)
	@echo "Installing Neovim initrc"
	@mkdir -p ${XDG_CONFIG_HOME}/nvim
	@ln -fs ${CURDIR}/nvimrc ${XDG_CONFIG_HOME}/nvim/init.vim
	@if [ ! -f "${XDG_DATA_HOME}/nvim/site/autoload/plug.vim" ]; then \
		curl -fLo "${XDG_DATA_HOME}/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi

install-polybar:
	$(call check_installed,polybar,polybar)
	@mkdir -p ${XDG_CONFIG_HOME}/polybar/
	@ln -fs ${CURDIR}/polybar/config ${XDG_CONFIG_HOME}/polybar/config
	@ln -fs ${CURDIR}/polybar/launch.sh ${XDG_CONFIG_HOME}/polybar/launch.sh
	@ln -fs ${CURDIR}/polybar/player-mpris-simple.sh ${XDG_CONFIG_HOME}/polybar/player-mpris-simple.sh

install-ranger:
	$(call check_installed,ranger,ranger)
	$(call check_installed,w3m,w3m)
	$(call check_installed,aunpack,atools)
	@echo "Installing .config/ranger/rc.conf"
	@mkdir -p ${XDG_CONFIG_HOME}/ranger/plugins
	@ln -fs ${CURDIR}/ranger/rc.conf ${XDG_CONFIG_HOME}/ranger/rc.conf
	@ln -fs ${CURDIR}/ranger/commands ${XDG_CONFIG_HOME}/ranger/commands.py
	@ln -fs ${CURDIR}/ranger/rifle.conf ${XDG_CONFIG_HOME}/ranger/rifle.conf
	@ln -fs ${CURDIR}/ranger/devicons/devicons.py ${XDG_CONFIG_HOME}/ranger/devicons.py
	@ln -fs ${CURDIR}/ranger/devicons/devicons_linemode.py ${XDG_CONFIG_HOME}/ranger/plugins/devicons_linemode.py

install-rofi:
	$(call check_installed,rofi,rofi)
	@echo "Installing rofi/config"
	@mkdir -p "${XDG_CONFIG_HOME}/rofi"
	@ln -fs "${CURDIR}/rofi" "${XDG_CONFIG_HOME}/rofi/config"

install-tig:
	@echo "Installing .tigrc"
	@ln -fs ${CURDIR}/tigrc ${HOME}/.tigrc

install-urxvt:
	@echo "Installing .Xresources for URxvt"
	@grep -q 'urxvt.xresources' ${HOME}/.Xresources || echo "#include \"${CURDIR}/urxvt.xresources\"" >> ${HOME}/.Xresources

install-zsh: install-dircolors
	@echo "Installing .zshrc"
	@ln -fs ${CURDIR}/zsh/rc ${HOME}/.zshrc
	@ln -fs ${CURDIR}/zsh/env ${HOME}/.zshenv
	@ln -fs ${CURDIR}/zsh/aliases.zsh ${XDG_DATA_HOME}/zsh/aliases.zsh
	@if [ ! -d "${XDG_DATA_HOME}/zsh/" ]; then \
		mkdir "${XDG_DATA_HOME}/zsh" ; \
		git clone https://github.com/tarjoilija/zgen.git "${XDG_DATA_HOME}/zsh/zgen"; \
	fi

update:
	@echo "Updating"
	@git pull --rebase origin master
