#
# Cookbook Name:: system
# Recipe:: antivirus
#
include_recipe 'apt::default'
include_recipe 'system::email_reports'

package 'clamav'

package 'clamav-daemon'

#execute 'update_clam_db' do
#  command 'freshclam'
#end

cron 'update_and_scan' do
  hour '4'
  minute '30'
  command 'echo `date` > /var/log/clamav/clamreport.log && /usr/bin/clamscan --log=/var/log/clamav/clamreport.log --recursive --infected --exclude=/proc --exclude=/dev/ --exclude=/sys / && echo `date` >> /var/log/clamav/clamreport.log'
end


