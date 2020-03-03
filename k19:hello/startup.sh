#!/bin/bash
# startup.sh
# -------------------------------------

/opt/docker/install.sh && echo "Install Ok"

# Engeguem serveis

/usr/sbin/httpd -DFOREGROUND
