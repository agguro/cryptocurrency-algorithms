xauth="$(ps -a -o pid= | xargs -I{} cat /proc/{}/environ 2>/dev/null | tr '\0' '\n' | grep -m1 '^XAUTHORITY=' | awk -F'=' '{print $2}')"
if [ -z "$xauth" ]
then
  xauth="$(ps a | grep X | grep -v grep | tr -s " " | cut -d " " -f 11)"
fi

echo "${xauth}"
