#
# Cookbook Name:: system
# Recipe:: email_reports
#

package 'postfix'
package 'mailutils' 
package 'libsasl2-2' 
package 'ca-certificates' 
package 'libsasl2-modules'

service 'postfix' do
  supports :status => true, :start => true, :stop => true, :restart => true, :reload => true
  action [:enable, :restart]
end  

execute 'backup_postfic_config' do 
  user 'root'
  command 'cp /etc/postfix/main.cf /var/backups/postfix_orig_main.cf'
  not_if 'ls /var/backups/postfix_orig_main.cf'
end 

cookbook_file '/etc/postfix/main.cf' do
  source 'main.cf'
  owner 'root'
  group 'root'
  mode '755'
  notifies :reload, 'service[postfix]', :immediately
end

  
