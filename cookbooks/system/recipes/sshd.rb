#
# Cookbook Name:: system
# Recipe:: sshd
#
# Copyleft 2015 Greg K.

package 'openssh-server'

cookbook_file '/etc/ssh/sshd_config' do
  source 'sshd_config'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'ssh' do
  supports :status => true
  action [:enable, :restart]
end

