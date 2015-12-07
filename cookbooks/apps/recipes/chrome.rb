#
# Cookbook Name:: apps
# Recipe:: chrome
#

remote_file '/usr/local/src/google-chrome_amd64.deb' do
  source 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
  owner 'grifonas'
  group 'grifonas'
  mode '0770'
end


dpkg_package 'google-chrome' do
  source '/usr/local/src/google-chrome_amd64.deb'
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


