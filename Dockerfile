FROM babim/oraclelinux6base

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

RUN yum update -y && \
    yum -y groupinstall "Desktop" "Desktop Platform" "X Window System" "Fonts" && \
    yum install gedit file-roller firefox nano iputils openssh-server tigervnc-server -y && \
    yum clean all

RUN echo 'root:123456' | chpasswd && \
    ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config

ADD runssh.sh /usr/sbin/runssh.sh
RUN chmod +x /usr/sbin/runssh.sh

ENV AUTHORIZED_KEYS **None**

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/usr/sbin/runssh.sh"]

# Expose ports.
EXPOSE 5901 22
