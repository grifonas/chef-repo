#
# Cookbook Name:: system
# Recipe:: default
#
# Copyleft November 2015; Greg K.

#template '/tmp/locale' do
 # source locale.erb
file 'tmp/locale' do 
  owner 'root'
  group 'root'
  mode '0644'
  content 'LANG="en_GB.UTF-8"
LC_NUMERIC="en_GB.UTF-8"
LC_TIME="en_GB.UTF-8"
LC_MONETARY="en_GB.UTF-8"
LC_PAPER="en_GB.UTF-8"
LC_NAME="en_GB.UTF-8"
LC_ADDRESS="en_GB.UTF-8"
LC_TELEPHONE="en_GB.UTF-8"
LC_MEASUREMENT="en_GB.UTF-8"
LC_IDENTIFICATION="en_GB.UTF-8"'
end

