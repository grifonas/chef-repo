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
  owner 'grifonas'
  group 'grifonas'
  mode '0775'
end
 
execute 'untar_btsync' do
  user 'grifonas'
  command '/bin/tar xzf /usr/src/BitTorrent-Sync_x64.tar.gz -C /opt/btsync'
end
