# syntax=docker/dockerfile:labs
FROM python:3.12.6-alpine3.20

RUN apk upgrade --no-cache -a && \
    apk add --no-cache ca-certificates tzdata tini netcat-openbsd && \
    pip install --no-cache-dir ssh-tarpit && \
    chown -R nobody:nobody /var/log

USER nobody
ENTRYPOINT ["tini", "--", "ssh-tarpit"]
CMD ["-a", "0.0.0.0", "-p", "22", "-f", "/var/log/tarpit.log"]
HEALTHCHECK CMD nc -z localhost 22 || exit 1
EXPOSE 22/tcp
