#!/bin/bash
# instal.lacio
# -------------------------------------

userList="pere marta jordi superuser"

adduser "pere"
echo "pere|pere" | passwd pere --stdin 

# Planchem els fitxers de config del client

cp /opt/docker/krb5.conf /etc/krb5.conf


