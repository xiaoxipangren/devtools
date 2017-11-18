#!/bin/bash 

echo "安装zsh"

sudo apt install zsh

#切换默认shell至zsh
chsh -s /bin/zsh 

echo "安装oh-my-zsh配置zsh"

git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh 

cp $HOme/.zshrc $HOME/.zshrc.bak

cp .zshrc $HOME/.zshrc
