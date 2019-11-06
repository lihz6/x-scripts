yum -y update
yum -y install memcached
systemctl daemon-reload
systemctl start memcached
systemctl status memcached