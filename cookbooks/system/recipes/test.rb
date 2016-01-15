#
# Cookbook Name:: system
# Recipe:: test
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
template '/tmp/chef_test' do
  source 'test.erb'
end
