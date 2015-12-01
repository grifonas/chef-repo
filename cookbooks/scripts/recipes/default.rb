#
# Cookbook Name:: scripts
# Recipe:: default
#
# Copyleft November 2015; Greg K.



include_recipe 'scripts::iPhone_bak_files_renamer.rb'
include_recipe 'scripts::mkv-remove-extra-tracks.rb'
include_recipe 'scripts::treesize.rb'

