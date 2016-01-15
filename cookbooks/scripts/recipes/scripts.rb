#
# Cookbook Name:: scripts
# Recipe:: scripts
#
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

template '/usr/local/bin/treesize.sh' do
  source 'treesize.sh.erb' 
  owner 'grifonas'
  group 'grifonas'
  mode '0775'
end

