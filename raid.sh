#!/bin/sh
mdadm --zero-superblock --force /dev/vd*
mdadm --create /dev/md122 -l 10 -n 4 /dev/vd{b,c,d,e}
mkfs.ext4 /dev/md122
mount /dev/md122 /mnt
cat /proc/mdstat
mdadm --examine --scan mdadm --detail --scan
mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf
echo -e "complite create RAID and mdadm.conf "
