#
# Cookbook Name:: apps
# Recipe:: plex
#

remote_file '/usr/local/src/plexmediaserver_amd64.deb' do
  source 'https://googledrive.com/host/0B9w4AKN_mSkcSURUM050YUI4dms/plexmediaserver_amd64.deb'
  owner 'grifonas'
  group 'grifonas'
  mode '0770'
end

dpkg_package 'plex' do
  source '/usr/local/src/plexmediaserver_amd64.deb'
end

