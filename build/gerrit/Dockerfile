FROM fedora:latest as stage
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
    openldap-servers \
    openldap-clients \
    && echo "all done"

COPY root1 /
RUN sh /opt/install.sh

# -----------------
FROM scratch

COPY --from=stage /stage /
COPY root2 /
RUN chmod +x /opt/* && \
    ln -svf /usr/sbin/busybox /sbin/init && \
    echo "container build at $(date)" >>/etc/created.txt 

VOLUME [ "/data" ]
EXPOSE 389/TCP

ENTRYPOINT [ "/sbin/init" ]