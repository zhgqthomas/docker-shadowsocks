## Docker-shadowsocks

This Dockerfile builds an image with [Shadowsocks-libev](https://github.com/shadowsocks/shadowsocks-libev) written in pure C. Based on Debian wheezy image.

## How to use this image

### Start the daemon for the first time

```bash
 $ docker run --name shadowsocks -d -p 443:443 zhgqthomas/shadowsocks -s 0.0.0.0 -p 443 -k $password -m aes-256-cfb
```

### Stop the daemon

```bash
$ docker stop shadowsocks
```

### Start a stoped daemon

```bash
$ docker start shadowsocks
```

### Shadowsocks clients

After running the image, please go [here](http://shadowsocks.org/en/download/clients.html) to download clients.