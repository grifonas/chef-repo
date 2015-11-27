#
# Cookbook Name:: system
# Recipe:: default
#
# Copyleft November 2015; Greg K.

template '/etc/default/locale' do
  source locale.erb
  owner 'root'
  group 'root'
  mode '0644'
end

