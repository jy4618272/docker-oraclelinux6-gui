FROM babim/oraclelinux6base

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

RUN yum -y groupinstall "Desktop" "Desktop Platform" "X Window System" "Fonts" && \
    yum install gedit file-roller firefox nano iputils tigervnc-server -y && \
    yum clean all

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["vncserver"]

# Expose ports.
EXPOSE 5901

ENV LC_ALL en_US.UTF-8
