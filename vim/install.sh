#!/bin/bash
#vim 8源码编译安装脚本
#author https://github.com/xiaoxipangren

#安装git
#sudo apt install git


#安装依赖库

#sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
#    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
#    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
#   python3-dev ruby-dev lua5.1 lua5.1-dev git


#卸载旧版本vim

IFS_OLD=$IFS
IFS=$'\n'

vim_old=""
for line in `dpkg -l | grep vim`
do
    IFS=$' '
    arr=($line)
    vim_old=${vim_old}" "${arr[1]}
done

ISF=$IFS_OLD
echo $vim_old

#sudo dpkg -P vim_old  

#下载源码
git clone https://github.com/vim/vim.git
echo "源码下载完成，开始进行编译安装。此过程将视电脑配置花费1-2个小时，请耐心等待......"

cd vim
#编译安装
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80
sudo make install

echo "编译安装完成，将进行vim安装后配置"

#安装后配置
home="/home/"`whoami`
vimrc=$home"/.vimrc"

echo "备份原.vimrc至.vimrc.bak"
cp $vimrc ${vimrc}".bak" 
cp ".vimrc" $home

echo "下载Vundle插件"
git clone https://github.com/gmarik/vundle.git ${home}"/.vim/bundle/Vundle.vim"







