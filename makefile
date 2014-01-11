all: zsh vim git less

zsh:
	@echo "Installing .zshrc"
	@ln -fs $(CURDIR)/zshrc ${HOME}/.zshrc
	@if [ ! -d "${HOME}/.local/share/zsh" ]; then \
		mkdir "${HOME}/.local/share/zsh" ; \
		git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${HOME}/.local/share/zsh/" ; \
	fi

vim:
	@echo "Installing .vimrc"
	@ln -fs $(CURDIR)/vimrc ${HOME}/.vimrc
	@if [ ! -d "${HOME}/.vim/bundle" ]; then \
		mkdir "${HOME}/.vim/bundle" ; \
		git clone "https://github.com/Shougo/neobundle.vim" "${HOME}/.vim/bundle/neobundle.vim" ; \
		"${HOME}/.vim/bundle/neobundle.vim/bin/neoinstall" ; \
	fi

git:
	@echo "Installing .gitconfig"
	@cp -f $(CURDIR)/gitconfig ${HOME}/.gitconfig
	@echo "Please insert your name and email address in .gitconfig"

less:
	@echo "Installing .lesskey"
	@ln -fs $(CURDIR)/lesskey ${HOME}/.lesskey
	@lesskey ${HOME}/.lesskey
