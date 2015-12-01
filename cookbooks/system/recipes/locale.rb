#
# Cookbook Name:: system
# Recipe:: default
#
# Copyleft November 2015; Greg K.

#template '/tmp/locale' do
 # source locale.erb
cookbook_file '/etc/default/locale' do
  source 'locale'
  owner 'root'
  group 'root'
  mode '0644'
end

