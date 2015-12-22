install: install-zsh install-vim install-git install-less install-tmux install-dircolors install-i3 install-ranger install-tig

install-zsh: install-dircolors
	@echo "Installing .zshrc"
	@ln -fs ${CURDIR}/zshrc ${HOME}/.zshrc
	@if [ ! -d "${HOME}/.local/share/zsh" ]; then \
		mkdir "${HOME}/.local/share/zsh" ; \
		git clone https://github.com/tarjoilija/zgen.git "${HOME}/.local/share/zsh/zgen"; \
	fi

install-vim:
	@echo "Installing .vimrc"
	@ln -fs ${CURDIR}/vimrc ${HOME}/.vimrc
	@if [ ! -f "${HOME}/.vim/autoload/plug.vim" ]; then \
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi

install-git:
	@echo "Installing .gitconfig"
	@ln -fs ${CURDIR}/gitconfig ${HOME}/.gitconfig
	@echo "Please insert your name and email address in .gitconfig (possibly in a local git branch)"

install-less:
	@echo "Installing .lesskey"
	@ln -fs ${CURDIR}/lesskey ${HOME}/.lesskey
	@lesskey ${HOME}/.lesskey

install-tmux:
	@echo "Installing .tmux.conf"
	@ln -fs ${CURDIR}/tmux.conf ${HOME}/.tmux.conf

install-dircolors:
	@echo "Installing .dir_colors"
	@if [ ! -d "${CURDIR}/dircolors-solarized" ]; then \
		git clone "https://github.com/seebi/dircolors-solarized.git" "${CURDIR}/dircolors-solarized" ; \
	fi
	@ln -fs ${CURDIR}/dircolors-solarized/dircolors.ansi-universal ${HOME}/.dir_colors

install-i3:
	@echo "Installing .config/i3/config"
	@mkdir -p ${HOME}/.config/i3/
	@ln -fs ${CURDIR}/i3config ${HOME}/.config/i3/config

install-ranger:
	@echo "Installing .config/ranger/rc.conf"
	@mkdir -p ${HOME}/.config/ranger/
	@ln -fs ${CURDIR}/rangerrc.conf ${HOME}/.config/ranger/rc.conf

install-tig:
	@echo "Installing .tigrc"
	@ln -fs ${CURDIR}/tigrc ${HOME}/.tigrc

install-aptitude:
	@echo "Installing .aptitude/config"
	@mkdir -p ${HOME}/.aptitude
	@ln -fs ${CURDIR}/aptitude ${HOME}/.aptitude/config

update:
	@echo "Updating"
	@git pull --rebase origin master
	@git submodule update
	@if [ ! -f "${HOME}/.vim/autoload/plug.vim" ]; then \
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi

