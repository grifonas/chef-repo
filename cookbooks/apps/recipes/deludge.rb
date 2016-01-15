#
# Cookbook Name:: apps
# Recipe:: launcher
#
# Copyleft December 2015 Greg K.

execute 'apt-get_update' do
  command 'sudo apt-get update'
end
package 'deluge'
package 'deluge-webui'
package 'deluge-console'
package 'deluged'



service 'deluged' do
  supports :status => true
  action [:enable, :start]
end
