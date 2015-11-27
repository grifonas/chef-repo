#
# Cookbook Name:: apt
# Recipe:: default
#
# Copyleft November 2015; Greg K.

execute 'apt-get update' do
  command 'apt-get update'
end
