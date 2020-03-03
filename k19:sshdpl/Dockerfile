# Version: 0.0.1
# @edt M06 2019-2020
# kerberos
# -------------------------------------
FROM fedora:27
LABEL author="Jordi Quirós Berbel"
LABEL description="SSH Kerberitzat 2019-2020"
RUN dnf -y install procps passwd nmap vim tree authconfig pam_mount pam_krb5 nfs-utils nss-pam-ldapd openldap-clients krb5-workstation openssh-server openssh-clients
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh /opt/docker/auth.sh
WORKDIR /opt/docker
CMD ["/opt/docker/startup.sh"]
