# shadowsocks
#
# VERSION 1.0.1

FROM debian:jessie
MAINTAINER Thomas <zhgqthomas@gmail.com>

ENV BASEDIR /tmp/shadowsocks-libev \
	BUILDDIR /tmp/build-area

# add Debian jessie backports
RUN echo "deb http://ftp.debian.org/debian jessie-backports main" | \
	tee /etc/apt/sources.list.d/backports.list 
# update repository & upgrade dependencies
RUN apt-get update
RUN apt-get -t jessie-backports upgrade -y --no-install-recommends
# git pull shadowsocks-libev
RUN apt-get install -y --no-install-recommends git
RUN git clone https://github.com/shadowsocks/shadowsocks-libev.git $BASEDIR
WORKDIR $BASEDIR
RUN git submodule update --init --recursive
# build shadowsocks-libev by script
RUN mkdir -p $BUILDDIR
RUN cp ./scripts/build_deb.sh $BUILDDIR
WORKDIR $BUILDDIR
RUN ./build_deb.sh

# Configure container to run as an executable
ENTRYPOINT ["/usr/bin/ss-server"]