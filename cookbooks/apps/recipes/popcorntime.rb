#
# Cookbook Name:: apps
# Recipe:: popcorntime
#

remote_file '/usr/src/Popcorn-Time-linux64.tar.gz' do
  source 'http://popcorn-time.se/Popcorn-Time-linux64.tar.gz'
  owner 'grifonas'
  group 'grifonas'
end

directory '/opt/popcorntime' do
  owner 'grifonas'
  group 'grifonas'
end

execute 'untar_popcorn' do
  user 'grifonas'
  command '/bin/tar xzf /usr/src/Popcorn-Time-linux64.tar.gz -C /opt/popcorntime'
end

execute 'fix_perms' do
  user 'root'
  command 'chown -R grifonas. /opt/popcorntime'
end 

remote_file '/usr/src/libudev0_175-0ubuntu9_amd64.deb' do
  source 'http://gr.archive.ubuntu.com/ubuntu/pool/main/u/udev/libudev0_175-0ubuntu9_amd64.deb'
end

dpkg_package '/usr/src/libudev0_175-0ubuntu9_amd64.deb' 