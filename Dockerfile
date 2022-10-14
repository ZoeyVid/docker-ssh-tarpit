FROM --platform=${BUILDPLATFORM} python:3.9.15-alpine3.16
RUN pip install --no-cache-dir ssh-tarpit
RUN ssh-tarpit -h
RUN apk add --no-cache netcat-openbsd
EXPOSE 22
LABEL org.opencontainers.image.source="https://github.com/SanCraftDev/docker-ssh-tarpit"
ENTRYPOINT ssh-tarpit -a 0.0.0.0 -p 22 -f /var/log/tarpit.log

HEALTHCHECK CMD nc -z localhost 22 || exit 1
