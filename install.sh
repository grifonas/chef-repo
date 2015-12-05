#!/bin/bash
if [[ $EUID -ne 0 ]]; then
 echo -e "Please run as root\n" 
 exit 1
fi
echo -e "Installing Git"
sudo apt-get update && sudo apt-get install git

mkdir /home/grifonas/Git
echo -e "Pulling chef-repo to /home/grifonas/Git/chef-repo"
cd /home/grifonas/Git/
git init
git clone https://github.com/grifonas/chef-repo.git
chown -R grifonas. /home/grifonas/Git/
echo -e "Chef repo created. Downloading ChefDK v. 0.10.0-1_amd64. Please wait...\n"
wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.10.0-1_amd64.deb -o /usr/src/chefdk_0.10.0-1_amd64.deb
echo -e "ChefDK saved to /usr/src/chefdk_0.10.0-1_amd64.deb\n Installing ChefDK..."

dpkg -i /usr/src/chefdk_0.10.0-1_amd64.deb
echo -e "Installed.\nApplying cookbooks..."
cd /home/grifonas/Git/chef-repo
 sudo chef-client --local-mode --runlist 'recipe[system],recipe[scripts],recipe[apps],recipe[utils]'

echo "Running config scripts manually..."
/bin/bash /tmp/create_vm.sh
/bin/bash /tmp/launcher.sh
