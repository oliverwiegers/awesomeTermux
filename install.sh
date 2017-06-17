#!$PREFIX/bin/bash

# install software
apt update -y && apt upgrade -y
apt install nodejs tmux unzip tar fontconfig wget git vim-python zsh curl ranger -y

#clone repo
git clone git@github.com:chrootzius/awesomeTermux.git
cd awesomeTermux/
mv .termux/ .vimrc README.md install.sh ../
cd
rm -rf awesomeTermux/

#vim config
git clone git@github.com:chrootzius/vim_config.git $HOME/.vim --depth 1
ln -sf /data/data/com.termux/files/home/.vim/.vimrc /data/data/com.termux/files/home/.vimrc

#backup
if [ -d "$HOME/.termux" ]; then
	mv $HOME/.termux $HOME/.termux.bak
fi

#zsh
git clone git@github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
chsh -s zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh-syntax-highlighting
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc

#settings
termux-setup-storage
curl -fsLo $HOME/.termux/colors.properties --create-dirs https://cdn.rawgit.com/chrootzius/awsomeTermux/master/.termux/colors.properties

#vim powerline
pip install powerline-status
exit
