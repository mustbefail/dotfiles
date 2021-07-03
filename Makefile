all: config-install

TAGS := all

update:
	nvim --headless +PlugUpdate +qall
	nvim --headless +CocUpdate +qall


configs-install:  
	ln -sf $(PWD)/doom ~/.doom.d
	ln -sf $(PWD)/kitty ~/.config/kitty
	ln -sf $(PWD)/rofi ~/.config/rofi
	ln -sf $(PWD)/.zshrc ~/
	ln -sf $(PWD)/ranger ~/.config/ranger
	mkdir -p ~/.config/nvim
	ln -sf $(PWD)/files/vimrc ~/.config/nvim/init.vim
	ln -sf $(PWD)/files/coc-settings.json ~/.config/nvim/coc-settings.json
	ln -snf $(PWD)/files/vim-ftplugins ~/.config/nvim/ftplugin

fedora-prepare:
	sudo dnf update
	sudo dnf install -y dnf-plugins-core
	sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
	sudo dnf install -yy neovim git the_silver_searcher fd-find fzf bat htop ncdu tldr httpie terraform-ls python3-neovim
	sudo dnf install ctags

deps-npm:
	npm install -g neovim
	npm install -g prettier eslint @babel/eslint-parser eslint-plugin-import eslint-plugin-node
	# npx install-peerdeps -g eslint-config-airbnb
	npm install -g stylelint stylelint-config-recommended stylelint-config-standard
	npm install -g yaml-language-server markdownlint bash-language-server
	npm install -g dockerfile-language-server-nodejs
