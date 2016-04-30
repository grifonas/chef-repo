#
# Cookbook Name:: tests
# Recipe:: test
#

#myvar = lambda {node['tests']['var']}
directory '/home/vagrant/results'

directory ("/tmp/#{node['tests']['var']}_dir")

file ("/tmp/#{node['tests']['var']}_file")

execute 'action_on_file_test' do
  command "echo file_test_only_if > /home/vagrant/results/file_test"
  only_if { ::File.exist?("/tmp/#{node['tests']['var']}_file") }
end

execute 'action_on_dir_test' do
  command "echo dir_test_only_if > /home/vagrant/results/dir_test"
  only_if { ::File.directory?("/tmp/#{node['tests']['var']}_dir") }
end

file '/home/vagrant/hosts'

execute 'add_to_host_file' do
  command 'echo test >> /home/vagrant/hosts'
  not_if File.readlines("/home/vagrant/hosts").grep("#{node['tests']['hostname']}").size > 0
end


