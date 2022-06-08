FROM fedora:latest as gerrit-stage

RUN yum update -y \
    && yum install -y \
    vim
RUN yum install -y --installroot=/stage --releasever=/ \
    busybox \
    && echo yes
COPY root /
RUN sh /opt/install.sh
ENTRYPOINT [ "/bin/sleep", "28800" ]