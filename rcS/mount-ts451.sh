#!/bin/bash
### BEGIN INIT INFO
# Provides:          mount-ts451
# Required-Start:   $local_fs
# Required-Stop: 
# Should-Start:      $network $portmap nfs-common  udev-mtab
# Default-Start:     S
# Default-Stop:
# Short-Description: Mount TS-451 nas
### END INIT INFO

PATH="/sbin:/bin"

mount_ts451() {
    mount -t cifs -o username="admin",password="2jgiogdl",uid=1000,dir_mode=0777 //192.168.1.151/home /home/mark/ts-451
    mount -t cifs -o username="admin",password="2jgiogdl",uid=1000,dir_mode=0777 //192.168.1.151/USBDisk1 /home/mark/ts-451_USBDisk1
    mount UUID="f9279b79-3329-406f-af82-75b845d51000" /home/mark/8TB_HDD
    mount UUID="c03b35a1-3cc4-4241-bead-573532caed6e" /home/mark/SSD
}
umount_ts451() {
    umount /home/mark/ts-451_USBDisk1
    umount /home/mark/ts-451
}
case "$1" in
    start)
    mount_ts451
    ;;

    stop)
    umount_ts451
    ;;

    *)
    echo "Usage: /etc/init.d/mount_ts451.sh {start|stop}" >&2
    exit 1
    ;;
esac

exit 0

