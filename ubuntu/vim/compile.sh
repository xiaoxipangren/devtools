#!/bin/bash
#vim 8源码编译安装脚本
#author https://github.com/xiaoxipangren

#安装git
#sudo apt install git


#安装依赖库

sudo apt install libncurses5-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
   python3-dev ruby-dev lua5.1 lua5.1-dev git -y


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

echo ${vim_old}
ISF=$IFS_OLD

sudo dpkg -P ${vim_old}  

#下载源码

if [ -d vim ]
then
    rm -rf vim
fi

git clone https://github.com/vim/vim.git
echo "源码下载完成，开始进行编译安装。此过程将视电脑配置花费1-2个小时，请耐心等待......"

cd vim

#编译安装

echo "默认执行基于python2的安装，注意由于系统的限制，ubuntu上请在python2/python3中选择一种"
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-python3interp \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --with-python-config-dir=/usr/lib/python3.9/config-3.9-x86_64-linux-gnu \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-cscope --prefix=/usr
sudo make install

echo "编译安装完成，将进行vim安装后配置"

cd ..
rm -rf vim
