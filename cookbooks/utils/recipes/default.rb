#
# Cookbook Name:: utils
# Recipe:: default
#
include_recipe 'apt'

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
