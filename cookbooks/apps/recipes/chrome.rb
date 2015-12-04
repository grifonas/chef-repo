#
# Cookbook Name:: apps
# Recipe:: chrome
#
# Copyleft November 2015 TGreg K.

remote_file '/usr/local/src/google-chrome_amd64.deb' do
  source 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
  owner 'grifonas'
  group 'grifonas'
  mode '0755'
end

dpkg_package 'google-chrome' do
  source '/usr/local/src/google-chrome_amd64.deb'
end

