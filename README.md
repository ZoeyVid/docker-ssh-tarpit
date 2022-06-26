# docker-ssh-tarpit

## Latest

```yaml
version: "3"
services:
  ssh-tarpit:
    container_name: ssh-tarpit
    image: sancraftdev/docker-ssh-tarpit:latest
    restart: always
    ports:
      - '22:22'
    volumes:
      - '/opt/tarpit.log:/var/log/tarpit.log'
```

## Develop

```yaml
version: "3"
services:
  ssh-tarpit:
    container_name: ssh-tarpit
    image: sancraftdev/docker-ssh-tarpit:develop
    restart: always
    ports:
      - '22:22'
    volumes:
      - '/opt/tarpit.log:/var/log/tarpit.log'
```
