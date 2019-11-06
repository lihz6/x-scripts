# old_repo=/etc/yum.repos.d/bintray-rabbitmq-server.repo
# if [[ -f $old_repo ]]; then
#   rm -f $old_repo
# fi

cat <<- EOF > /etc/yum.repos.d/rabbitmq-server.repo
[rabbitmq-server]
name=rabbitmq-server
baseurl=https://dl.bintray.com/rabbitmq/rpm/rabbitmq-server/v3.7.x/el/7/
gpgcheck=1
gpgkey=https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc
repo_gpgcheck=0
enabled=1
EOF

cat <<- EOF >  /etc/yum.repos.d/rabbitmq-erlang.repo
[rabbitmq-erlang]
name=rabbitmq-erlang
baseurl=https://dl.bintray.com/rabbitmq-erlang/rpm/erlang/21/el/7
gpgcheck=1
gpgkey=https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc
repo_gpgcheck=0
enabled=1
EOF

yum -y update
yum -y install erlang
yum -y install rabbitmq-server

rabbitmq-plugins enable rabbitmq_management
rabbitmq-plugins enable rabbitmq_web_stomp
systemctl daemon-reload
systemctl start rabbitmq-server

#查看当前用户列表
# rabbitmqctl list_users
 
#添加admin用户，用户名和密码
rabbitmqctl add_user admin Hugeinfo123
 
#设置admin的角色为administrator
rabbitmqctl set_user_tags admin administrator
 
#设置admin用户的权限，可访问所有
rabbitmqctl set_permissions -p "/" admin ".*" ".*" ".*"

systemctl restart rabbitmq-server
systemctl status rabbitmq-server
