FROM alpine:20221110

RUN apk upgrade --no-cache && \
    apk add --no-cache ca-certificates wget tzdata python3 py3-pip netcat-openbsd && \
    pip install --no-cache-dir ssh-tarpit && \
    apk del --no-cache py3-pip

EXPOSE 22
ENTRYPOINT ["ssh-tarpit"]
CMD ["-a", "0.0.0.0", "-p", "22", "-f", "/var/log/tarpit.log"]
HEALTHCHECK CMD nc -z localhost 22 || exit 1
