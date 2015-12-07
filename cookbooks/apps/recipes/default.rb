#
# Cookbook Name:: apps
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apps::plex'
include_recipe 'apps::skype'
include_recipe 'apps::virtualbox'
include_recipe 'apps::chrome'
include_recipe 'apps::all_apps'
include_recipe 'apps::launcher'
