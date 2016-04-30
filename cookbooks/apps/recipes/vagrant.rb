#
# Cookbook Name:: apps
# Recipe:: vagrant
#
remote_file '/tmp/vagrant_1.8.1_x86_64.deb' do
  source 'https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb'
end

execute 'install_vagrant' do
  command 'dpkg -i /tmp/vagrant_1.8.1_x86_64.deb'
end
