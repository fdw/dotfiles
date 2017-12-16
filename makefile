install: install-zsh install-nvim install-git install-less install-dircolors install-i3 install-ranger install-tig install-htop install-rofi

install-zsh: install-dircolors
	@echo "Installing .zshrc"
	@ln -fs ${CURDIR}/zshrc ${HOME}/.zshrc
	@ln -fs ${CURDIR}/zshenv ${HOME}/.zshenv
	@ln -fs ${CURDIR}/aliases.zsh ${XDG_DATA_HOME}/zsh/aliases.zsh
	@if [ ! -d "${XDG_DATA_HOME}/zsh/zplug" ]; then \
		mkdir "${XDG_DATA_HOME}/zsh" ; \
		git clone https://github.com/tarjoilija/zgen.git "${XDG_DATA_HOME}/zsh/zgen"; \
	fi

install-nvim:
	@echo "Installing Neovim initrc"
	@mkdir -p ${XDG_CONFIG_HOME}/nvim
	@ln -fs ${CURDIR}/nvimrc ${XDG_CONFIG_HOME}/nvim/init.vim
	@if [ ! -f "${XDG_DATA_HOME}/nvim/site/autoload/plug.vim" ]; then \
		curl -fLo "${XDG_DATA_HOME}/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi

install-git:
	@echo "Installing .gitconfig"
	@ln -fs ${CURDIR}/gitconfig ${HOME}/.gitconfig
	@ln -fs ${CURDIR}/gitignore ${HOME}/.gitignore
	@echo "Please insert your name and email address in .gitconfig (possibly in a local git branch)"

install-less:
	@echo "Installing .lesskey"
	@ln -fs ${CURDIR}/lesskey ${HOME}/.lesskey
	@lesskey ${HOME}/.lesskey

install-dircolors: prepare-submodules
	@echo "Installing .dir_colors"
	@ln -fs ${CURDIR}/dircolors-solarized/dircolors.ansi-universal ${HOME}/.dir_colors

install-i3:
	@echo "Installing .config/i3/config"
	@mkdir -p ${XDG_CONFIG_HOME}/i3/
	@ln -fs ${CURDIR}/i3config ${XDG_CONFIG_HOME}/i3/config
	@mkdir -p ${XDG_CONFIG_HOME}/i3status/
	@ln -fs ${CURDIR}/i3status ${XDG_CONFIG_HOME}/i3status/config

install-ranger: prepare-submodules
	@echo "Installing .config/ranger/rc.conf"
	@mkdir -p ${XDG_CONFIG_HOME}/ranger/plugins
	@ln -fs ${CURDIR}/rangerrc.conf ${XDG_CONFIG_HOME}/ranger/rc.conf
	@ln -fs ${CURDIR}/rangercommands ${XDG_CONFIG_HOME}/ranger/commands.py
	@ln -fs ${CURDIR}/ranger_devicons/devicons.py ${XDG_CONFIG_HOME}/ranger/devicons.py
	@ln -fs ${CURDIR}/ranger_devicons/devicons_linemode.py ${XDG_CONFIG_HOME}/ranger/plugins/devicons_linemode.py

install-tig:
	@echo "Installing .tigrc"
	@ln -fs ${CURDIR}/tigrc ${HOME}/.tigrc

install-aptitude:
	@echo "Installing .aptitude/config"
	@mkdir -p ${HOME}/.aptitude
	@ln -fs ${CURDIR}/aptitude ${HOME}/.aptitude/config

install-htop:
	@echo "Installing htoprc"
	@mkdir -p "${XDG_CONFIG_HOME}/htop"
	@ln -fs "${CURDIR}/htoprc" "${XDG_CONFIG_HOME}/htop/htoprc"

install-rofi:
	@echo "Installing rofi/config"
	@mkdir -p "${XDG_CONFIG_HOME}/rofi"
	@ln -fs "${CURDIR}/rofi" "${XDG_CONFIG_HOME}/rofi/config"

update:
	@echo "Updating"
	@git pull --rebase origin master
	@git submodule update

prepare-submodules:
	git submodule init
	git submodule update
