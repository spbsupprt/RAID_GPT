#!/bin/sh
umount /dev/md122 /mnt
mdadm -S /dev/md122
mdadm --zero-superblock --force /dev/vd*
rm /etc/mdadm/mdadm.conf
echo -e "All clear"
