#
# Cookbook Name:: system
# Recipe:: default
#
# Copyleft November 2015; Greg K.

#template '/tmp/locale' do
 # source locale.erb
include_recipe 'apt::default'
include_recipe 'system::locale'
include_recipe 'system::hideipvpn'
include_recipe 'system::mount_drive'
