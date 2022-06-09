#!/bin/bash
set -eE

cd /stage/opt
curl -O https://gerrit-releases.storage.googleapis.com/gerrit-${GERRIT_VERSION}.war

# cleanup, remove excess to make image small
mapfile F2D </opt/files2remove.txt
echo "files2remove ${F2D[@]}"
rm -rf ${F2D[@]/#//stage}

ln -sfv /usr/sbin/busybox /stage/sbin/init
du -sh /stage 
date >>/etc/created.txt
echo "all done"
exit 0