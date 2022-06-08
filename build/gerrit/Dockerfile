FROM scratch

COPY --from=gerrit-stage  /stage /
COPY root /
RUN chmod +x /opt/*

ENTRYPOINT [ "/sbin/init" ]