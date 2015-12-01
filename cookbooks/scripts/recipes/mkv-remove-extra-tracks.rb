#
# Cookbook Name:: scripts
# Recipe:: mkv-remove-extra-tracks
#
# Copyleft November 2015 Greg K.
template '/usr/local/bin/mkv-remove-extra-tracks.sh' do
  source 'mkv-remove-extra-tracks.sh.erb'
  owner 'grifonas'
  group 'grifonas'
  mode '0775'
end
