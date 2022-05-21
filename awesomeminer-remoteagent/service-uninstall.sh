systemctl stop awesome
systemctl disable awesome
rm /lib/systemd/system/awesome.service
systemctl daemon-reload
