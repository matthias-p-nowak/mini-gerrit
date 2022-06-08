#!/bin/sh
du -sh /*
sleep 30
ps -e
date
rm /usr/sbin/busybox
echo "busybox removed"
echo "script finished"
