#
# Cookbook Name:: scripts
# Recipe:: default
#
# Copyleft November 2015; Greg K.


include_recipe 'apt::default'
include_recipe 'scripts::iPhone_bak_files_renamer'
include_recipe 'scripts::mkv-remove-extra-tracks'
include_recipe 'scripts::treesize'

