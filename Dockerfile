FROM python:3.12.1-alpine3.19

RUN apk add --no-cache ca-certificates tzdata tini netcat-openbsd && \
    pip install --no-cache-dir ssh-tarpit

ENTRYPOINT ["tini", "--", "ssh-tarpit"]
CMD ["-a", "0.0.0.0", "-p", "22", "-f", "/var/log/tarpit.log"]
HEALTHCHECK CMD nc -z localhost 22 || exit 1
