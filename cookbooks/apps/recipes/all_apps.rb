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


