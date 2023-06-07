FROM python:3.11.4-alpine3.18

RUN apk add --no-cache ca-certificates tzdata netcat-openbsd && \
    pip install --no-cache-dir ssh-tarpit

ENTRYPOINT ["ssh-tarpit"]
CMD ["-a", "0.0.0.0", "-p", "22", "-f", "/var/log/tarpit.log"]
HEALTHCHECK CMD nc -z localhost 22 || exit 1
