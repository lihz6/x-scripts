sudo yum -y update
sudo yum -y groupinstall 'Development Tools'


cd /tmp

wget http://zlib.net/zlib-1.2.11.tar.gz
wget https://ftp.pcre.org/pub/pcre/pcre-8.43.tar.gz
wget https://www.openssl.org/source/openssl-1.0.2r.tar.gz
wget http://tengine.taobao.org/download/tengine-2.3.0.tar.gz

tar xf zlib-1.2.11.tar.gz
tar xf pcre-8.43.tar.gz
tar xf openssl-1.0.2r.tar.gz
tar xf tengine-2.3.0.tar.gz

cd tengine-2.3.0

./configure\
    --with-http_gzip_static_module\
    --with-http_ssl_module\
    --with-http_v2_module\
    --with-pcre=../pcre-8.43\
    --with-zlib=../zlib-1.2.11\
    --with-openssl=../openssl-1.0.2r
make
sudo make install

cat <<- EOF > /usr/lib/systemd/system/tengine.service
[Unit]
Description=The tengine HTTP and reverse proxy server
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=/usr/local/nginx/logs/nginx.pid
# Nginx will fail to start if /usr/local/nginx/logs/nginx.pid already exists but has the wrong
# SELinux context. This might happen when running `nginx -t` from the cmdline.
# https://bugzilla.redhat.com/show_bug.cgi?id=1268621
ExecStartPre=/usr/bin/rm -f /usr/local/nginx/logs/nginx.pid
ExecStartPre=/usr/local/nginx/sbin/nginx -t
ExecStart=/usr/local/nginx/sbin/nginx
ExecReload=/usr/local/nginx/sbin/nginx -s reload
KillSignal=SIGQUIT
TimeoutStopSec=5
KillMode=process
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF
