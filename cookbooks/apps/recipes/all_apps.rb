#
# Cookbook Name:: apps
# Recipe:: launcher
#
# Copyleft December 2015 Greg K.

cookbook_file '/tmp/launcher.sh' do
  source 'launcher.sh'
  user 'grifonas'
  group 'grifonas'
  mode '0770'
end

remote_file '/usr/local/src/google-chrome_amd64.deb' do
  source 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
  owner 'grifonas'
  group 'grifonas'
  mode '0770'
end

dpkg_package 'google-chrome' do
  source '/usr/local/src/google-chrome_amd64.deb'
end

remote_file '/usr/local/src/skype-ubuntu_i386.deb' do
  source 'https://googledrive.com/host/0B9w4AKN_mSkcSURUM050YUI4dms/skype-ubuntu_i386.deb'
  owner 'grifonas'
  group 'grifonas'
  mode '0770'
end

dpkg_package 'skype' do
  source '/usr/local/src/skype-ubuntu_i386.deb'
  action :install
  ignore_failure true
  notifies :run, 'execute[apt-get-fix-dep]', :immediately
end

execute 'apt-get-fix-dep' do
  command 'sudo apt-get -f install -y'
  action :run
end

remote_file '/usr/local/src/plexmediaserver_amd64.deb' do
  source 'https://googledrive.com/host/0B9w4AKN_mSkcSURUM050YUI4dms/plexmediaserver_amd64.deb'
  owner 'grifonas'
  group 'grifonas'
  mode '0770'
end

dpkg_package 'plex' do
  source '/usr/local/src/plexmediaserver_amd64.deb'
end

remote_file '/usr/local/src/virtualbox-5.0.10_amd64.deb' do
  source 'http://download.virtualbox.org/virtualbox/5.0.10/virtualbox-5.0_5.0.10-104061~Ubuntu~wily_amd64.deb'
  owner 'grifonas'
  group 'grifonas'
  mode '0770'
end

dpkg_package 'virtualbox' do
  source '/usr/local/src/virtualbox-5.0.10_amd64.deb'
end


package 'vim'
package 'aptitude'
package 'mkvtoolnix'
package 'mkvtoolnix-gui'
package 'mplayer2'
package 'avidemux'
package 'flac'
package 'lame'
package 'ffmpeg' 
package 'deluge'
package 'deluge-webui'
package 'deluge-console'
package 'deluged'

service 'deluged' do
  supports :status => true
  action [:enable, :start]
end

execute 'add_apps_to_launcher' do
  command '/bin/bash /tmp/launcher.sh'
  user 'grifonas'  
end


