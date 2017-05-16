#!$PREFIX/bin/bash

# install software
apt update -y && apt upgrade -y
apt install nodejs tmux unzip tar fontconfig wget git vim-python zsh curl ranger -y

#clone repo
curl -LOk https://github.com/chrootzius/awesomeTermux/archive/master.zip
unzip master.zip
cd awesomeTermux-master/
mv .vim/ .termux/ .vimrc README.md install.sh ../
cd
rm -rf awesomeTermux-master/
rm master.zip

if [ -d "$HOME/.termux" ]; then
	mv $HOME/.termux $HOME/.termux.bak
fi

#zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh --depth 1
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
chsh -s zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
mv zsh-syntax-highlighting .zsh-syntax-highlighting
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc

#settings
termux-setup-storage
curl -fsLo $HOME/.termux/colors.properties --create-dirs https://cdn.rawgit.com/chrootzius/awsomeTermux/master/.termux/colors.properties
curl -fsLo $HOME/.vimrc --create-dirs https://raw.githubusercontent.com/chrootzius/awesomeTermux/master/.vimrc

#vim powerline
pip install powerline-status
exit
