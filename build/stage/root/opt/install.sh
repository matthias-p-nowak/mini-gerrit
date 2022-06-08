#!/bin/bash
set -eEx

# keep the required binaries
ln /stage/usr/sbin/busybox /stage/tmp

mapfile F2D </opt/files2remove.txt
echo "files2remove ${F2D[@]}"
rm -rfv ${F2D[@]/#//stage}

# copy required binaries back
ln /stage/tmp/busybox /stage/usr/sbin
chroot /stage /usr/sbin/busybox --install -s
rm -rfv /stage/tmp/*
du -sh /stage 

echo "all done"