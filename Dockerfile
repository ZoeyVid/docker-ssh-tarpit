FROM --platform=${BUILDPLATFORM} python:3.9.13-alpine3.16
RUN pip install --no-cache-dir ssh-tarpit
EXPOSE 22
ENTRYPOINT ssh-tarpit -a 0.0.0.0 -p 22 -f /var/log/tarpit.log
