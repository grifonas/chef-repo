#
# Cookbook Name:: apps
# Recipe:: launcher
#
# Copyleft December 2015 Greg K.

execute 'add_apps_to_launcher' do
  command '/usr/bin/gsettings set com.canonical.Unity.Launcher favorites "['application://google-chrome.desktop', 'application://firefox.desktop', 'application://nautilus.desktop', 'application://deluge.desktop', 'application://gnome-terminal.desktop', 'unity://running-apps', 'unity://devices', 'unity://expo-icon']"'
  user 'grifonas'  
  action :nothing
end

remote_file '/usr/local/src/google-chrome_amd64.deb' do
  source 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
  owner 'grifonas'
  group 'grifonas'
  mode '0755'
end

dpkg_package 'google-chrome' do
  source '/usr/local/src/google-chrome_amd64.deb'
  action :nothing
  notifies :run, 'execute[add_apps_to_launcher]', :delayed
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
package 'deluge' do
  notifies :run, 'execute[google-chrome]', :delayed
end

package 'deluge-webui'
package 'deluge-console'
package 'deluged'

service 'deluged' do
  supports :status => true
  action [:enable, :start]
end

