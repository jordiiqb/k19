#!/bin/bash
# startup.sh
# -------------------------------------

/opt/docker/install.sh && echo "Install Ok"

# Engeguem serveis

/usr/sbin/krb5kdc && echo "krb5kdc OK" # Tickets
/usr/sbin/kadmind && echo "kadmind OK" # Admin
