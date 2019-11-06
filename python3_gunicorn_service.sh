cat <<-EOF >/etc/systemd/system/gunicorn.service
[Unit]
Description=gunicorn service
After=network.target

[Service]
PIDFile=/run/gunicorn/pid
WorkingDirectory=/home/someuser/applicationroot
ExecStart=/usr/bin/gunicorn --pid=/run/gunicorn/pid --bind=127.0.0.1:5000  --threads=8 server:app
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s TERM $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF