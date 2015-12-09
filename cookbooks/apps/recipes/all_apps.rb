#
# Cookbook Name:: apps
# Recipe:: launcher
#
# Copyleft December 2015 Greg K.


package 'vim'
package 'aptitude'
package 'mkvtoolnix'
package 'mkvtoolnix-gui'
package 'mplayer2'
package 'flac'
package 'lame'
package 'ffmpeg' 
package 'deluge'
package 'deluge-webui'
package 'deluge-console'
package 'deluged'
package 'vlc'
service 'deluged' do
  supports :status => true
  action [:enable, :start]
end

execute 'apt-get-clean' do
  command 'sudo apt-get clean'
end

execute 'apt-get-upgrade' do
  command 'apt-get upgrade -y -q'
end
