#!/bin/bash
# instal.lacio
# -------------------------------------

groupadd local01
useradd -g users -G local01 local01
useradd -g users -G local01 local02
useradd -g users -G local01 local03
echo "local01" | passwd --stdin local01
echo "local02" | passwd --stdin local02
echo "local03" | passwd --stdin local03

# Afegim el servidor a l' /etc/hosts

cat add_hosts.txt >> /etc/hosts

# Planchem els fitxers de config del client

bash auth.sh && echo "GENERACIO DEL AUTHCONFIG OK"

cp /opt/docker/nslcd.conf /etc/nslcd.conf
cp /opt/docker/nsswitch.conf /etc/nsswitch.conf
cp /opt/docker/ldap.conf /etc/openldap/.
cp /opt/docker/krb5.conf /etc/krb5.conf

