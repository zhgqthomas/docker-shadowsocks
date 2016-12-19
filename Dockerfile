# shadowsocks
#
# VERSION 0.0.3

FROM debian:wheezy
MAINTAINER Thomas <zhgqthomas@gmail.com>

ENV BASEDIR /tmp/shadowsocks-libev

RUN echo "deb http://ftp.debian.org/debian wheezy-backports main" | \
	tee /etc/apt/sources.list.d/backports.list
RUN apt-get update && \
	apt-get -t wheezy-backports install -y dh-systemd init-system-helpers
RUN apt-get install -y --no-install-recommends build-essential autoconf libtool libssl-dev \
    gawk debhelper dh-systemd init-system-helpers pkg-config asciidoc xmlto apg libpcre3-dev git-core
RUN git clone https://github.com/shadowsocks/shadowsocks-libev.git $BASEDIR
WORKDIR $BASEDIR
RUN dpkg-buildpackage -b -us -uc -i
RUN cd .. && dpkg -i shadowsocks-libev*.deb

# Configure container to run as an executable
ENTRYPOINT ["/usr/bin/ss-server"]