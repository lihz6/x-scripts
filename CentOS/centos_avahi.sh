sudo yum install -y avahi

sudo systemctl enable avahi-daemon
sudo systemctl start avahi-daemon
sudo firewall-cmd --zone=public --permanent --add-service=mdns
sudo systemctl restart firewalld