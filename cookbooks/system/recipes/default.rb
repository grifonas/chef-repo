#
# Cookbook Name:: system
# Recipe:: default
#
# Copyleft November 2015; Greg K.

#template '/tmp/locale' do
 # source locale.erb
include_recipe 'system::locale'
include_recipe 'system::hideipvpn'
