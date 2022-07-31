# docker-ssh-tarpit

```yaml
version: "3"
services:
    ssh-tarpit:
        container_name: ssh-tarpit
        image: sancraftdev/docker-ssh-tarpit:latest
#        image: sancraftdev/docker-ssh-tarpit:develop
        restart: always
        ports:
        - "22:22"
        volumes:
        - "/opt/tarpit.log:/var/log/tarpit.log"
        environment:
        - "TZ=Europe/Berlin"
```
