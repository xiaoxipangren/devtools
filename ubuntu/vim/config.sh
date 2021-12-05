#!/bin/bash
#vim 8源码编译安装脚本
#author https://github.com/xiaoxipangren

#安装后配置
vimrc=$HOME"/.vimrc"

echo "备份原.vimrc至.vimrc.bak"
cp $vimrc ${vimrc}".bak" 
cp .vimrc $HOME

vundle=$HOME"/.vim/bundle/Vundle.vim"
if [ -d $vundle ];
then
    rm -rf $vundle
fi

sudo apt install cmake build-essentisl python python3 python-dev python3-dev

echo "下载Vundle插件"
git clone https://github.com/gmarik/vundle.git $vundle

echo "配置vim插件"

vim +PluginInstall +quit +quit


path=`pwd`
echo "配置YCM插件"
cd $HOME"/.vim/bundle/YouCompleteMe"
git submodule update --init --recursive
./install.py 

echo "安装完成,请参考.vimrc中的说明文件使用快捷键"
