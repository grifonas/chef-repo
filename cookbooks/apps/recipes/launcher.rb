#
# Cookbook Name:: apps
# Recipe:: launcher
#
cookbook_file '/tmp/launcher.sh' do
  source 'launcher.sh'
  user 'grifonas'
  group 'grifonas'
  mode '0770'
end

execute 'add_apps_to_launcher' do
  command '/bin/bash /tmp/launcher.sh'
  user 'grifonas'
end


