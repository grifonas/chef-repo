#!/bin/bash

/usr/bin/VBoxManage createvm --name 'Hato-PC-Win' --ostype "Windows7_64" --register
/usr/bin/VBoxManage modifyvm "Hato-PC-Win" --memory 8000
