#!/bin/bash
# instal.lacio
# -------------------------------------

userList="pere marta jordi superuser"

# Planchem els fitxers de config del servidor

cp /opt/docker/krb5.conf /etc/krb5.conf
cp /opt/docker/kdc.conf /var/kerberos/krb5kdc/kdc.conf

# Afegim la resolució de noms per al servidor a /etc/hosts

cat /opt/docker/add_host.txt >> /etc/hosts

# Creem la base de dades

/usr/sbin/kdb5_util create -s -P jupiter

# Creem les ACLs

cat /opt/docker/add_acls.txt >> /var/kerberos/krb5kdc/kadm5.acl

# Creem els principals de Kerberos

for princ in $userList
do
  /usr/sbin/kadmin.local -q "addprinc -pw k$princ k$princ"
done
