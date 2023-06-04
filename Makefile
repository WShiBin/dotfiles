backup:
	# Vim
	rsync ~/my_configs.vim .
	rsync ~/.zshrc .

	# Git
	rsync ~/.gitconfig .

	# Alacritty
	rsync ~/.config/alacritty/alacritty.yml .config/alacritty/

	# Starship
	rsync ~/.config/starship.toml .config/

	# Helix
	rsync -avh --no-perms ~/.config/helix .config/

	# Zellij
	rsync -avh --no-perms ~/.config/zellij .config/

	# Brew
	brew bundle dump --force --describe

update:
	# TODO:
	echo "update"

	# oh-my-zsh update
	omz update

	# homebrew update
	brew update

	# vimrc update
	cd ~/.vim_runtime
	git reset --hard
	git clean -d --force
	git pull --rebase
	python update_plugins.py  # use python3 if python is unavailable

install:
	# TODO:
	# zsh: https://www.zsh.org/
	# TODO: check if zsh is installed
	chsh -s $(which zsh) # Change default shell to zsh

	# oh-my-zsh: https://ohmyz.sh/
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	# brew: https://brew.sh/
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	brew bundle --file=./Brewfile

	# vim: https://www.vim.org/
	# vimrc: https://github.com/amix/vimrc
	pushd ~
	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh
	cp my_configs.vim ~/
	popd

	mkdir ~/.config

	# Alacritty
	# Alacritty theme
	pushd ~
	mkdir -p ~/.config/alacritty/themes
	git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
	popd

	# cleanup
	brew cleanup --prune=all

macos_init:
	xcode-select --install