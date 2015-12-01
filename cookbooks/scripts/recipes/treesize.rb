#
# Cookbook Name:: scripts
# Recipe:: treesize
#
# Copyleft November 2015. Greg K.
template '/usr/local/bin/treesize.sh' do
  source 'treesize.sh.erb' 
  owner 'grifonas'
  group 'grifonas'
  mode '0775'
end

