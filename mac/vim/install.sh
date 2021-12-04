#!/bin/bash
#author https://github.com/xiaoxipangren

#安装git
brew install vim
brew install coreutils
echo "编译安装完成，将进行vim安装后配置"

#安装后配置
home=${HOME}
vimrc=$home"/.vimrc"

echo "备份原.vimrc至.vimrc.bak"
cp $vimrc ${vimrc}".bak" 
cp .vimrc $home

vundle=$home"/.vim/bundle/Vundle.vim"
if [ -d $vundle ];
then
    rm -rf $vundle
fi

echo "下载Vundle插件"
git clone https://github.com/gmarik/vundle.git $vundle

echo "配置vim插件"

vim +PluginInstall +quit +quit

echo "配置YCM插件"
cd $home"/.vim/bundle/YouCompleteMe"
#YCM本身支持python2或者python3，将视系统的python环境自动配置YCM的python解释器
git submodule update --init --recursive --depth 1
./install.py --all

echo "安装完成,请参考.vimrc中的说明文件使用快捷键"
