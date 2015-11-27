#!/bin/bash
if [[ $EUID -ne 0 ]]; then
 echo -e "Please run as root\n" 
 exit 1
fi
#echo -e "Downloading ChefDK v. 0.10.0-1_amd64. Please wait...\n"
#wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.10.0-1_amd64.deb -o /usr/src/chefdk_0.10.0-1_amd64.deb
#echo -e "ChefDK saved to /usr/src/chefdk_0.10.0-1_amd64.deb\n Installing CHefDK..."

#dpkg -i /usr/src/chefdk_0.10.0-1_amd64.deb
#echo -e "Installed.\nApplying cookbooks..."
for cookbook in `ls ./cookbooks/`; do
 echo "sudo chef-client --local-mode --runlist 'recipe[$cookbook]'";
done
