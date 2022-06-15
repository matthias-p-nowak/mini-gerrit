#!/bin/sh
set -eE
echo "starting initialize.sh @$(date)" | tee -a /etc/created.txt

GD=/data/gerrit
GDC=${GD}/etc/gerrit.config

rm -rfv /etc/openldap/slapd.* 
mkdir -pv /etc/openldap/slapd.d /data/gerrit /data/ldap-data
# dry run for testing
/usr/sbin/slaptest -u -f /opt/slapd.conf -F /etc/openldap/slapd.d 
# next one fails because database cannot yet be open
/usr/sbin/slaptest -f /opt/slapd.conf -F /etc/openldap/slapd.d || echo "failure ignored"

echo "gerrit version ${GERRIT_VERSION}"
ln -svf /opt/gerrit-*.war /opt/gerrit.war
echo "link created @$(date)" | tee -a /etc/created.txt

if [ ! -d /data/gerrit/etc ]
then
    echo "initializing gerrit" | tee -a /etc/created.txt
    /usr/bin/java -jar /opt/gerrit.war init --batch --no-auto-start -d ${GD} \
        --install-plugin gitiles \
        --install-plugin hooks \
        --install-plugin delete-project 
    echo "gerrit initialized $(date)" | tee -a /etc/created.txt
fi
git config --file ${GDC} auth.type ldap
git config --file ${GDC} gerrit.canonicalWebUrl http://localhost:8080/
cat /opt/gerrit+.config >> ${GDC}
cat ${GDC}

echo "initialize.sh done @$(date)" | tee -a /etc/created.txt

exit 0