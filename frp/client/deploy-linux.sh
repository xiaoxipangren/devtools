#!/bin/bash

dir=/usr/local/frpc
service=/lib/systemd/system/frpc.service

sudo echo 'install frpc'

if [ ! -d $dir  ];then
   sudo mkdir $dir
fi

cp config.ini start.sh $dir/

cp linux/frpc $dir/

cp frpc.service  $service

systemctl daemon-reload
systemctl start frpc


