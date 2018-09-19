#!/bin/bash

dir=/usr/local/frpc
plist=/Library/LaunchDaemons/`whoami`.frpc.plist

sudo echo 'install frpc'

if [ ! -d $dir  ];then
    sudo mkdir $dir
fi

cp config.ini start.sh $dir/

cp mac/frpc $dir/

cp frpc.plist $plist

launchctl load -w $plist


