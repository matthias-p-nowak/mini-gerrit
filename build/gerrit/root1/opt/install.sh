#!/bin/bash



# cleanup, remove excess to make image small
mapfile F2D </opt/files2remove.txt
echo "files2remove ${F2D[@]}"
rm -rf ${F2D[@]/#//stage}

echo "all done @$(date)" | tee -a /stage/etc/created.txt
