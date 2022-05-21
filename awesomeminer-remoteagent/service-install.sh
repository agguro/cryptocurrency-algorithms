pwd=`pwd`
fullpath=$pwd/AwesomeMiner.RemoteAgent.Linux
sed -i "s|.*ExecStart.*|ExecStart=$fullpath|" awesome.service
echo "Installing and starting as service: $fullpath"

cp awesome.service /lib/systemd/system
systemctl daemon-reload
systemctl enable awesome
systemctl start awesome

active=`systemctl is-active awesome`
echo "Current status: $active"

platform=`uname -m`

if case $platform in arm*) false;; esac; then
    command -v bash >/dev/null 2>&1 || { echo >&2 "WARNING: Missing prerequisite package 'bash'. Please install before you start mining."; }
    command -v screen >/dev/null 2>&1 || { echo >&2 "WARNING: Missing prerequisite package 'screen'. Please install before you start mining."; }
fi
