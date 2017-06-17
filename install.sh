#!$PREFIX/bin/bash

# install software
apt update -y && apt upgrade -y
apt install nodejs tmux unzip tar fontconfig wget git vim-python zsh curl ranger -y

#clone repo
git clone --recursive https://github.com/chrootzius/awesomeTermux.git .

#vim config
git clone --recursive https://github.com/chrootzius/vim_config.git .vim
ln -sf /data/data/com.termux/files/home/.vim/.vimrc /data/data/com.termux/files/home/.vimrc

#backup
if [ -d "$HOME/.termux" ]; then
	mv $HOME/.termux $HOME/.termux.bak
fi

#zsh
git clone https://github.com/zsh-users/zsh-completions.git .oh-my-zsh/custom/pluins/zsh-completions
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
chsh -s zsh

#settings
termux-setup-storage
curl -fsLo $HOME/.termux/colors.properties --create-dirs https://cdn.rawgit.com/chrootzius/awsomeTermux/master/.termux/colors.properties

#vim powerline
pip install powerline-status
print 'Add "vi-mode jump git zsh-competions sudo" to the plugin section of your .zshrc'
exit
