FROM alpine

MAINTAINER ZerounNet

RUN apk --no-cache add openssh && \
    mkdir -p /var/run/sshd && \
    rm -rvf /etc/ssh/ssh_host_*_key* && \
    ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa && \
    ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa && \
    ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa && \
    ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519 && \
    rm -rfv /etc/init.d/sshd

CMD ["/usr/sbin/sshd","-D"]
