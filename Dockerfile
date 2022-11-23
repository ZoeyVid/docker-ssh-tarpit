FROM alpine:20221110

RUN apk upgrade --no-cache && \
    apk add --no-cache ca-certificates wget tzdata python3 netcat-openbsd && \
    wget https://bootstrap.pypa.io/pip/pip.pyz -O /tmp/pip.pyz && \
    python3 /tmp/pip.pyz install --no-cache-dir ssh-tarpit && \
    rm -rf /tmp/pip.pyz

ENTRYPOINT ["ssh-tarpit"]
CMD ["-D", "-a", "0.0.0.0", "-p", "22", "-f", "/var/log/tarpit.log"]
HEALTHCHECK CMD nc -z localhost 22 || exit 1
