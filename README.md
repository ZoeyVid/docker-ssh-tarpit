# docker-ssh-tarpit

This docker image runs https://github.com/Snawoot/ssh-tarpit rootless.

```yaml
services:
  ssh-tarpit:
    container_name: ssh-tarpit
    image: zoeyvid/docker-ssh-tarpit
    restart: always
    ports:
      - "22:22"
    volumes:
      - "/opt/tarpit.log:/var/log/tarpit.log"
    environment:
      - "TZ=Europe/Berlin"
```
