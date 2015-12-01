#
# Cookbook Name:: scripts
# Recipe:: default
#
# Copyleft November 2015; Greg K.



include_recipe 'iPhone_bak_files_renamer.rb'
include_recipe 'mkv-remove-extra-tracks.rb'
include_recipe 'treesize.rb'

template '/usr/local/bin/treesize.sh' do
  source 'treesize.sh.erb' 
  owner 'grifonas'
  group 'grifonas'
  mode '0775'
end

package 'libimage-exiftool-perl'

template '/usr/local/bin/iPhone_bak_files_renamer.sh' do
  source 'iPhone_bak_files_renamer.sh.erb'
  owner 'grifonas'
  group 'grifonas'
  mode '0775'
end

template '/usr/local/bin/mkv-remove-extra-tracks.sh' do
  source 'mkv-remove-extra-tracks.sh.erb'
  owner 'grifonas'
  group 'grifonas'
  mode '0775'
end
