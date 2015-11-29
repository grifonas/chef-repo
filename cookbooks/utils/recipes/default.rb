#
# Cookbook Name:: utils
# Recipe:: default
#
include_recipe 'apt::default'
include_recipe 'utils::my_scripts'
package 'vim'
package 'aptitude'
package 'deluged'

service 'deluged' do
  supports :status => true
  action [:enable, :start]
end
package 'deluge'
package 'deluge-webui'
package 'deluge-console'
package 'mkvtoolnix'
package 'mkvtoolnix-gui'
package 'mplayer2'
package 'avidemux'
package 'flac'
package 'lame'
package 'ffmpeg'

