#/bin/sh

echo 0 > /sys/class/rfkill/rfkill0/state
echo 1 > /sys/class/rfkill/rfkill0/state

hciattach -n /dev/ttymxc0 qca 3000000 -t30 flow
