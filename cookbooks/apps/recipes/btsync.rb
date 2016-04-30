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

# Adding to startup applications
directory /home/grifonas/.config/autostart do
  recursive true
  owner 'grifonas'
  group 'grifonas'
end

cookbook_file '/home/grifonas/.config/autostart/btsync.desktop' do
  source 'btsync.desktop'
  mode '664'
  owner 'grifonas'
  group 'grifonas'
end
