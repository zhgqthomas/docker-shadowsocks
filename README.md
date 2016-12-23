## Docker-shadowsocks
This Dockerfile builds an image with [Shadowsocks-libev](https://github.com/shadowsocks/shadowsocks-libev) written in pure C. Based on Debian wheezy image.

## How to use this image

### Start the daemon for the first time
```bash
 $ sudo docker run --name shadowsocks -d -p 443:443 zhgqthomas/shadowsocks -s 0.0.0.0 -p 443 -k $password -m aes-256-cfb
```

### Stop the daemon

```bash
$ sudo docker stop shadowsocks
```

### Start a stoped daemon
```bash
$ sudo docker start shadowsocks
```

### Shadowsocks clients
After running the image, please go [here](http://shadowsocks.org/en/download/clients.html) to download clients.

### Use docker-compose.yml
Make sure [docker compose](https://docs.docker.com/compose/install/) was installed. After clone this project on your host, please run the follow command inside the project.
```bash
$ sudo docker-compose up -d
```
