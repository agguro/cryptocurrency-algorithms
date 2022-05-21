systemctl stop awesome

active=`systemctl is-active awesome`
echo "Current status: $active"
