#!/bin/bash
echo "正在安装Ubuntu Desktop"
apt install net-tools -y
host_ip=$(ifconfig | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+' | head -n1)
apt-get update -y
sudo apt-get install iptables
sudo iptables -I INPUT -p tcp --dport 3389 -j ACCEPT
iptables-save
sudo netfilter-persistent save 
sudo netfilter-persistent reload
sudo apt-get install xrdp -y
sudo apt-get install vnc4server -y
sudo apt-get install xubuntu-desktop -y
echo "xfce4-session" >~/.xsession
sudo service xrdp restart
echo "Ubuntu Desktop已安装完成！"
echo "远程桌面地址为：$host_ip:3389"
