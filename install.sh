#!$PREFIX/bin/bash

#backup
if [ -d "$HOME/.termux" ]; then
	mv $HOME/.termux $HOME/.termux.bak
fi
# install software
apt update -y && apt upgrade -y
apt install python-dev openssh man make autoconf libllvm cmake nodejs tmux unzip tar fontconfig wget git vim-python zsh curl ranger clang -y 
#clone repo
git clone --recursive https://github.com/chrootzius/awesomeTermux.git .

#vim config
git clone --recursive https://github.com/chrootzius/vim_config.git .vim
ln -sf /data/data/com.termux/files/home/.vim/.vimrc /data/data/com.termux/files/home/.vimrc

#zsh
git clone https://github.com/zsh-users/zsh-completions.git .oh-my-zsh/custom/pluins/zsh-completions
chsh -s zsh

#settings
termux-setup-storage

#vim 
pip install powerline-status
cd ".vim/pack/plugins/start/YouCompleteMe/"
termux-fix-shebang install.py
./install.py
cd

#recreate directory structure
mkdir -p documents/scripts/
mkdir projects/

exit
