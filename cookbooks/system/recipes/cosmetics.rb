#
# Cookbook Name:: system
# Recipe:: cosmetics
#
cookbook_file '/usr/share/backgrounds/building.jpg' do
  source 'my_wallpaper.jpg'
end 

cookbook_file '/tmp/cosmetics.sh' do
  source 'cosmetics.sh'
  owner 'grifonas'
  group 'grifonas'
  mode '0755'
end

execute 'run_cometics' do
  user 'grifonas'
  command '/bin/bash /tmp/cosmetics.sh'
end

