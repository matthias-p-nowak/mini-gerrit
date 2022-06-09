#!/bin/sh
ls -l /data
ln -sfv /opt/gerrit-${GERRIT_VERSION}.war /opt/gerrit.war
echo "starting gerrit script @$(date)" | tee -a /etc/created.txt
if [ ! -d /data/etc ]
then
    echo "initializing gerrit" | tee -a /etc/created.txt
    /usr/bin/java -jar /opt/gerrit-${GERRIT_VERSION}.war init --batch --no-auto-start -d /data
    echo "gerrit initialized $(date)" | tee -a /etc/created.txt
fi

# exec java -jar /opt/gerrit-${GERRIT_VERSION}.war daemon -d /data
(
    sleep 10
    echo "halleluja $(date)" | tee -a /etc/created.txt
) &
echo "start-gerrit.sh ended $(date)" | tee -a /etc/created.txt
