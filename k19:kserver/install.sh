#!/bin/bash
# instal.lacio
# -------------------------------------

# Planchem els fitxers de config del servidor

cp /opt/docker/krb5.conf /etc/krb5.conf
cp /opt/docker/kdc.conf /var/kerberos/krb5kdc/kdc.conf

# Creem la base de dades

/usr/sbin/kdb5_util create -s -P jupiter

# Creem les ACLs

cat /opt/docker/add_acls.txt >> /var/kerberos/krb5kdc/kadm5.acl

# Creem els principals de Kerberos

kadmin.local -q "addprinc -pw kpere pere"
kadmin.local -q "addprinc -pw kanna anna"
kadmin.local -q "addprinc -pw kpau pau"
kadmin.local -q "addprinc -pw kjordi jordi"
kadmin.local -q "addprinc -pw kmarta marta"
kadmin.local -q "addprinc -pw kmarta marta/admin"
kadmin.local -q "addprinc -pw kjulia julia"
kadmin.local -q "addprinc -pw superuser superuser"
kadmin.local -q "addprinc -pw user01 user01"
kadmin.local -q "addprinc -pw user02 user02"
kadmin.local -q "addprinc -pw user03 user03"
kadmin.local -q "addprinc -pw user04 user04"
kadmin.local -q "addprinc -pw user05 user05"
kadmin.local -q "addprinc -pw user06 user06"
kadmin.local -q "addprinc -randkey host/sshd.edt.org"
