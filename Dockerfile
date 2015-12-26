FROM babim/oraclelinux6base

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

RUN yum -y groupinstall "Desktop" "Desktop Platform" "X Window System" "Fonts" && \
    yum install gedit file-roller firefox nano iputils tigervnc-server -y && \
    yum clean all

# Define default command.
RUN echo "bash" > /startup.sh && echo "vncserver" >> /startup.sh && echo "/usr/sbin/sshd -D" >> /startup.sh && chmod +x /startup.sh
CMD ["/startup.sh"]

# Expose ports.
EXPOSE 5901

ENV LC_ALL en_US.UTF-8
ENV TZ Asia/Ho_Chi_Minh
