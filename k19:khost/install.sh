#!/bin/bash
# instal.lacio
# -------------------------------------

userList="pere marta jordi superuser"

adduser "pere"
echo "pere|pere" | passwd pere --stdin 

# Planchem els fitxers de config del client

cp /opt/docker/krb5.conf /etc/krb5.conf

# Afegim la resolució de noms per al servidor a /etc/hosts

cat /opt/docker/add_host.txt >> /etc/hosts

