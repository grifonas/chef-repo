#
# Cookbook Name:: google-chrome
# Recipe:: default
#
# Copyleft 2015 Greg K.

remote_file '/tmp/google-chrome-stable_current_amd64.deb' do
  source 'https://www.google.co.uk/chrome/browser/thankyou.html?platform=linux/google-chrome-stable_current_amd64.deb'
  mode '0644'
end

dpkg_package 'google-chrome' do
  source '/tmp/google-chrome-stable_current_amd64.deb'
  action :install
end
