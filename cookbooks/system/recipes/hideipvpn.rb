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

template '/usr/local/bin/vpn-connect.sh'
  source 'vpn_connect.sh.erb'
  mode '770'
  owner 'grifonas'
  group 'grifonas'
end
  
