#!/bin/bash
# startup.sh
# -------------------------------------

/opt/docker/install.sh && echo "Install Ok"

# Engeguem serveis

/sbin/nscd 
/sbin/nslcd

# Generacio del fitxer krb5.keytab per la kerberitzacio

kadmin -p superuser -w superuser -q "ktadd -k /etc/krb5.keytab host/sshd.edt.org"

/sbin/sshd -D
