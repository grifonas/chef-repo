#
# Cookbook Name:: system
# Recipe:: hideipvpn
#
# Copyleft 2015 Greg K.
template '/etc/NetworkManager/system-connections/HideIPVPN' do
  source 'hideipvpn.erb'
  mode '600'
  owner 'root'
  group 'root'
end
