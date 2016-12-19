# shadowsocks
#
# VERSION 0.0.1

FROM debian:wheezy
MAINTAINER Thomas <zhgqthomas@gmail.com>

RUN echo "deb http://ftp.debian.org/debian wheezy-backports main" | \
	tee /etc/apt/sources.list.d/backports.list
RUN apt-get update && \
	apt-get -t wheezy-backports install dh-systemd init-system-helpers
RUN apt-get install --no-install-recommends build-essential autoconf libtool libssl-dev \
    gawk debhelper dh-systemd init-system-helpers pkg-config asciidoc xmlto apg libpcre3-dev git
RUN git clone https://github.com/shadowsocks/shadowsocks-libev.git
RUN cd shadowsocks-libev && dpkg-buildpackage -b -us -uc -i
RUN cd .. && dpkg -i shadowsocks-libev*.deb
RUN /etc/init.d/shadowsocks-libev start

# Configure container to run as an executable
ENTRYPOINT ["/usr/bin/ss-server"]