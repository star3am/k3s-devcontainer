# https://github.com/star3am/hashiqube/blob/master/Dockerfile
# https://betterprogramming.pub/managing-virtual-machines-under-vagrant-on-a-mac-m1-aebc650bc12c
# https://github.com/rofrano/vagrant-docker-provider

FROM ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive

# Install packages needed for SSH and interactive OS
RUN apt-get update -qq < /dev/null > /dev/null
RUN apt-get -y install -qq \
        openssh-server \
        passwd \
        sudo \
        man-db \
        curl \
        wget \
        vim-tiny < /dev/null > /dev/null

# Install base packages 
COPY ./etc/basetools/basetools.sh .
RUN bash ./basetools.sh; \
    rm ./basetools.sh;

# Set message of the day MOTD file
COPY ./etc/update-motd.d/00-header /etc/update-motd.d/

# Apt clean
RUN apt-get -qq clean < /dev/null > /dev/null
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Enable systemd (from Matthew Warman's mcwarman/vagrant-provider)
RUN find /lib/systemd/system/sysinit.target.wants -mindepth 1 -not -name "systemd-tmpfiles-setup.service" -delete; \
    find /lib/systemd/system/multi-user.target.wants -mindepth 1 -not -name "systemd-user-sessions.service" -delete; \
    rm -f /etc/systemd/system/*.wants/*; \
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*; \
    rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN echo "ubuntu:ubuntu" | chpasswd && \
    mkdir -p /etc/sudoers.d && \
    echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/ubuntu && \
    chmod 440 /etc/sudoers.d/ubuntu

# Run the init daemon
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
