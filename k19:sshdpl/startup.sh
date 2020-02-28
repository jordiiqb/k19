#!/bin/bash
# startup.sh
# -------------------------------------

/opt/docker/install.sh && echo "Install Ok"

# Engeguem serveis

/sbin/nscd 
/sbin/nslcd

/sbin/sshd -D
