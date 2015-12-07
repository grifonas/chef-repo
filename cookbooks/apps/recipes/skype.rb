#
# Cookbook Name:: apps
# Recipe:: skype
#
remote_file '/usr/local/src/skype-ubuntu_i386.deb' do
  source 'https://googledrive.com/host/0B9w4AKN_mSkcSURUM050YUI4dms/skype-ubuntu_i386.deb'
  owner 'grifonas'
  group 'grifonas'
  mode '0770'
end

dpkg_package 'skype' do
  source '/usr/local/src/skype-ubuntu_i386.deb'
  action :install
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


