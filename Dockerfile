FROM alpine:20221110

RUN apk upgrade --no-cache
RUN apk add --no-cache python3 py3-pip netcat-openbsd
RUN pip install --no-cache-dir ssh-tarpit
RUN ssh-tarpit -h

LABEL org.opencontainers.image.source="https://github.com/SanCraftDev/docker-ssh-tarpit"

EXPOSE 22
ENTRYPOINT ssh-tarpit -a 0.0.0.0 -p 22 -f /var/log/tarpit.log

HEALTHCHECK CMD nc -z localhost 22 || exit 1
