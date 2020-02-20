# Version: 0.0.1
# @edt M06 2019-2020
# kerberos
# -------------------------------------
FROM fedora:27
LABEL author="Jordi Quirós Berbel"
LABEL description="Kerberos server 2019-2020"
RUN dnf -y install procps passwd nmap vim tree krb5-server
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh
WORKDIR /opt/docker
CMD ["/opt/docker/startup.sh"]
