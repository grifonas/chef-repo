#
# Cookbook Name:: apps
# Recipe:: awscli
#
execute 'apt-get-update' do
  command 'sudo apt-get update'
end

package 'python'
package 'unzip'
package 'curl'

execute 'get_aws_cli' do
  command 'curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "/tmp/awscli-bundle.zip"'
end

execute 'unzip_aws_cli' do
  command 'unzip /tmp/awscli-bundle.zip -d /tmp/' 
end

execute 'install_aws_cli' do
  command 'sudo /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws'
end
  
