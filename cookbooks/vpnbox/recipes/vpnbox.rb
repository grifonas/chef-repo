#
# Cookbook Name:: vpnbox
# Recipe:: vpnbox
#
# Greg Konradt
execute "apt-get update" do
  command 'apt-get update'
end

#execute "apt-get upgrade -y" do
#  command 'apt-get upgrade'
#end

package ['wget', 'vim', 'curl', 'openvpn']

bash "setup IPTables" do
  code <<-EOH
    sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
    sudo iptables -A FORWARD -o tun0 -i eth0 -s 192.168.1.0/24 -m conntrack --ctstate NEW -j ACCEPT
    sudo iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    sudo iptables -A POSTROUTING -t nat -j MASQUERADE
    sudo iptables-save | sudo tee /etc/iptables.sav
    sed '\#net\.ipv4\.ip_forward=1/net\.ipv4\.ip_forward\=1/g' 
EOH
end



