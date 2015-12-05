#
# Cookbook Name:: system
# Recipe:: mount_drive
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

directory '/media/grifonas/120GBHDD' do
  owner 'grifonas'
  group 'grifonas'
  mode '700'
  only if 'ls /dev/ | grep -q "sdb1"'
  notifies :install, 'package[ntfs-3g]', :immediately
end

package 'ntfs-3g' do
  action :install
  notifies :run, 'execute[add_fstab_entry]', :immediately
end

execute 'add_fstab_entry' do
  user 'root'
  command '/bin/echo "/dev/sdb1       /media/grifonas/120GBHDD        ntfs-3g permissions,locale=en_GB.utf8    0   2" >> /etc/fstab'
  only_if 'ls /dev/ | grep -q "sdb1"'
  not_if 'grep -q "/media/grifonas/120GBHDD" /etc/fstab'
  notifies :run, 'execute[mount_120_drive]', :immediately
end 

execute 'mount_120_drive' do
  command '/bin/mount /media/grifonas/120GBHDD'
  user 'root'
  ignore_failure true  
  action :nothing
end

