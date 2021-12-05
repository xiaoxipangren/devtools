#!/bin/bash

dir=/usr/local/frpc
service=/lib/systemd/system/frpc.service

sudo echo 'install frpc'

if [ ! -d $dir  ];then
   sudo mkdir $dir
fi

cp config.ini frpc start.sh $dir/

cp frpc.service  $service

sudo systemctl daemon-reload
sudo systemctl enable frpc
systemctl start frpc


