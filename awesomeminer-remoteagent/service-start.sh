systemctl start awesome

active=`systemctl is-active awesome`
echo "Current status: $active"
