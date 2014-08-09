install: install-zsh install-vim install-git install-less install-tmux

install-zsh: install-dircolors
	@echo "Installing .zshrc"
	@ln -fs ${CURDIR}/zshrc ${HOME}/.zshrc
	@if [ ! -d "${HOME}/.local/share/zsh" ]; then \
		mkdir "${HOME}/.local/share/zsh" ; \
		git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${HOME}/.local/share/zsh/" ; \
	fi

install-vim:
	@echo "Installing .vimrc"
	@ln -fs ${CURDIR}/vimrc ${HOME}/.vimrc
	@if [ ! -d "${HOME}/.vim/bundle" ]; then \
		mkdir "${HOME}/.vim/bundle" ; \
		git clone "https://github.com/Shougo/neobundle.vim" "${HOME}/.vim/bundle/neobundle.vim" ; \
		"${HOME}/.vim/bundle/neobundle.vim/bin/neoinstall" ; \
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

update:
	@echo "Updating"
	@git pull --rebase origin master
	@git submodule update
