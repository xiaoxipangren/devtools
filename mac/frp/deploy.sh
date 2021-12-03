#!/bin/bash

dir=/usr/local/frpc
plist=/Library/LaunchDaemons/frpc.plist

sudo echo 'install frpc'

if [ ! -d $dir  ];then
    sudo mkdir $dir
fi

cp config.ini frpc  start.sh $dir/

cp frpc.plist $plist

launchctl load -w $plist
