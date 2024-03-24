FROM python:3.12.2-alpine3.19

RUN apk upgrade --no-cache -a && \
    apk add --no-cache ca-certificates tzdata tini netcat-openbsd && \
    pip install --no-cache-dir ssh-tarpit

USER nobody
ENTRYPOINT ["tini", "--", "ssh-tarpit"]
CMD ["-a", "0.0.0.0", "-p", "22", "-f", "/var/log/tarpit.log"]
HEALTHCHECK CMD nc -z localhost 22 || exit 1
