#
# Cookbook Name:: system
# Recipe:: sshd
#
# Copyleft 2015 TGreg K.

openssh_server '/etc/ssh/sshd_config' do
  Port 6758
  AllowUsers 'grifonas@52.16.55.4 grifonas@localhost grifonas@10.0.0.1/24'
end
  
