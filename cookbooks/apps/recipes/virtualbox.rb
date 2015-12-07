#
# Cookbook Name:: apps
# Recipe:: virtualbox
#

remote_file '/usr/local/src/virtualbox-5.0.10_amd64.deb' do
  source 'http://download.virtualbox.org/virtualbox/5.0.10/virtualbox-5.0_5.0.10-104061~Ubuntu~wily_amd64.deb'
  owner 'grifonas'
  group 'grifonas'
  mode '0770'
end

dpkg_package 'virtualbox' do
  source '/usr/local/src/virtualbox-5.0.10_amd64.deb'
  ignore_failure true
  notifies :run, 'execute[apt-get-fix-dep]', :immediately
end

execute 'apt-get-fix-dep' do
  command 'sudo apt-get -f install -y'
  notifies :run, 'execute[apt-get-clean]', :immediately
end

execute 'apt-get-clean' do
  command 'sudo apt-get clean'
end

cookbook_file '/tmp/create_vm.sh' do
  source 'create_vm.sh'
  user 'grifonas'
  group 'grifonas'
  mode '0770'
  notifies :run, 'execute[create_vm]', :immediately
end

execute 'create_vm' do
  command '/bin/bash /tmp/create_vm.sh'
  user 'grifonas'  
end

package 'dkms'
