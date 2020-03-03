# Version: 0.0.1
# @edt M06 2019-2020
# 
# -------------------------------------
FROM fedora:27
LABEL author="Jordi Quirós Berbel"
LABEL description="HELLO 2019-2020"
RUN dnf -y install httpd nmap
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh
WORKDIR /opt/docker
EXPOSE 80
CMD ["/opt/docker/startup.sh"]
