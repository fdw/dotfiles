all: zsh vim git less


zsh:
	@echo "Installing .zshrc"
	@rm -f ${HOME}/.zshrc
	@ln -s $(CURDIR)/zshrc ${HOME}/.zshrc
	@if [ ! -d "${HOME}/.local/share/zsh" ]; then \
		mkdir "${HOME}/.local/share/zsh" ; \
		git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${HOME}/.local/share/zsh/" ; \
	fi

vim:
	@echo "Installing .vimrc"
	@rm -f ${HOME}/.vimrc
	@ln -s $(CURDIR)/vimrc ${HOME}/.vimrc
	@if [ ! -d "${HOME}/.vim/bundle" ]; then \
		mkdir "${HOME}/.vim/bundle" ; \
		git clone "https://github.com/Shougo/neobundle.vim" "${HOME}/.vim/bundle/neobundle.vim" ; \
		"${HOME}/.vim/bundle/neobundle.vim/bin/neoinstall" ; \
	fi

git:
	@echo "Installing .gitconfig"
	@rm -f ${HOME}/.gitconfig
	@ln -s $(CURDIR)/gitconfig ${HOME}/.gitconfig

less:
	@echo "Installing .lesskey"
	@rm -f ${HOME}/.lesskey
	@ln -s $(CURDIR)/lesskey ${HOME}/.lesskey
	@lesskey ${HOME}/.lesskey
