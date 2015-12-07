#
# Cookbook Name:: system
# Recipe:: cosmetics
#
execute 'enable_workspaces' do
  command 'gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2'
end

cookbook_file '/usr/share/backgrounds/building.jpg' do
  source 'my_wallpaper.jpg'
end 

execute 'set_wallpaper' do
  command 'gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/building.jpg'
end
