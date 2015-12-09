#!/bin/bash

/usr/bin/VBoxManage createvm --name 'Hato-PC-Win' --ostype "Windows7_64" --register
/usr/bin/VBoxManage modifyvm "Hato-PC-Win" --memory 8000
/usr/bin/VBoxManage storagectl 'Hato-PC-Win' --name "SATA Controller" --add sata --controller IntelAHCI
/usr/bin/VBoxManage storageattach 'Hato-PC-Win' --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium /media/grifonas/120GBHDD/VM_Drives/hato-pc-win-vm.vdi
