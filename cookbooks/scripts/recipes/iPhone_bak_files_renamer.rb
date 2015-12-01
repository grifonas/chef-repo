#
# Cookbook Name:: scripts
# Recipe:: iPhone_bak_files_renamer
#
# Copyleft November 2015. Greg K.
package 'libimage-exiftool-perl'

template '/usr/local/bin/iPhone_bak_files_renamer.sh' do
  source 'iPhone_bak_files_renamer.sh.erb'
  owner 'grifonas'
  group 'grifonas'
  mode '0775'
end

