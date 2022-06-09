FROM fedora:latest as gerrit-stage
ARG GERRIT_VERSION=0.0.0
RUN yum update -y \
    && yum install -y \
    git \
    less \
    vim

RUN yum install -y --installroot=/stage --releasever=/ \
    busybox \
    git \
    java-11-openjdk-headless \
    net-tools \
    openssh-clients \
    && echo yes
COPY root /
RUN sh /opt/install.sh
ENTRYPOINT [ "/bin/sleep", "28800" ]