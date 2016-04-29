#
# Cookbook Name:: apps
# Recipe:: btsync
#
remote_file '/usr/src/BitTorrent-Sync_x64.tar.gz' do
  source 'https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz'
  owner 'grifonas'
  group 'grifonas'
end

directory '/opt/btsync' do
  recursive true
  owner 'grifonas'
  group 'grifonas'
  mode '0775'
end
 
execute 'untar_btsync' do
  command '/bin/tar xzf /usr/src/BitTorrent-Sync_x64.tar.gz -C /opt/btsync'
end

execute 'fix_perms' do
  user 'root'
  command 'chown -R grifonas. /opt/btsync'
end

cookbook_file '/opt/btsync/btsync.cnf' do
  source 'btsync.cnf'
end
#Creating upstart script:
template '/etc/init/btsync.conf' do
  source 'btsync.upstart.conf'
  mode '775'
  owner 'grifonas'
  group 'grifonas'
end
#Creating a link to thge upstart script in /etc/init.d/ This will get autocompletion working (Debian policy):
link '/etc/init.d/btsync' do
  to '/etc/init/btsync.conf'
end

#execute 'update_rc' do
#  user 'root'
#  command 'update-rc.d btsync default'
#end
#service "btsync" do
#  action [:enable, :start]
#end
