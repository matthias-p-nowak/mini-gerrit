#!/bin/bash
set -eE

cd /stage/opt
echo "downloading gerrit version ${GERRIT_VERSION}"
curl -O https://gerrit-releases.storage.googleapis.com/gerrit-${GERRIT_VERSION}.war

# cleanup, remove excess to make image small
mapfile F2D </opt/files2remove.txt
echo "files2remove ${F2D[@]}"
rm -rf ${F2D[@]/#//stage}

echo "install.sh done @$(date)" | tee -a /stage/etc/created.txt
exit 0