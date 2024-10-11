# syntax=docker/dockerfile:labs
FROM python:3.13.0-alpine3.20 AS pip
ENV PYTHONUNBUFFERED=1
COPY requirements.txt /tmp/requirements.txt
RUN apk upgrade --no-cache -a && \
    apk add --no-cache ca-certificates && \
    python3 -m venv /usr/local && \
    pip install --no-cache-dir -r /tmp/requirements.txt

FROM python:3.13.0-alpine3.20
ENV PYTHONUNBUFFERED=1
COPY --from=pip /usr/local /usr/local

RUN apk upgrade --no-cache -a && \
    apk add --no-cache ca-certificates tzdata tini netcat-openbsd && \
    chown -R nobody:nobody /var/log

USER nobody
ENTRYPOINT ["tini", "--", "ssh-tarpit"]
CMD ["-a", "0.0.0.0", "-p", "22", "-f", "/var/log/tarpit.log"]
HEALTHCHECK CMD nc -z localhost 22 || exit 1
EXPOSE 22/tcp
