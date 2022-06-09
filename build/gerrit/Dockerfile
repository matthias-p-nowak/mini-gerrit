FROM scratch
ARG GERRIT_VERSION=0.0.0

COPY --from=gerrit-stage  /stage /
COPY root /
RUN chmod +x /opt/*
RUN date >/etc/created.txt \
    && ls -l /sbin

VOLUME [ "/data" ]
EXPOSE 29418/TCP 8080/TCP

ENTRYPOINT [ "/sbin/init" ]