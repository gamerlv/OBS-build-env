FROM ubuntu:16.04

RUN apt-get update && \
	apt-get install -y git-core unzip build-essential checkinstall \
	autoconf \
	automake \
	cmake \
	libass-dev \
	libfreetype6-dev \
	libsdl2-dev \
	libtheora-dev \
	libtool \
	libva-dev \
	libvdpau-dev \
	libvorbis-dev \
	libxcb1-dev \
	libxcb-shm0-dev \
	libxcb-xfixes0-dev \
	mercurial \
	pkg-config \
	texinfo \
	wget \
	zlib1g-dev \
	yasm \
	libx264-dev \
	libx265-dev \
	libvpx-dev \
	libfdk-aac-dev \
	libmp3lame-dev \
	libopus-dev \
	librtmp-dev \
	libwebp-dev \
	libjack-jackd2-dev \
	libxinerama-dev libxcb-xinerama0-dev libxcb-shm0-dev \
	libx11-dev libgl1-mesa-dev libvlc-dev libpulse-dev libxcomposite-dev \
	libcurl4-openssl-dev libssl-dev \
	qtbase5-dev libqt5x11extras5-dev \
	libfontconfig-dev \
	ocl-icd-opencl-dev \
	libv4l-dev libudev-dev \
	swig libluajit-5.1-dev python3-dev && \
	apt-get clean

RUN mkdir /build /output

VOLUME /output

WORKDIR /build

RUN wget http://www.nasm.us/pub/nasm/releasebuilds/2.13.02/nasm-2.13.02.tar.bz2 && \
	tar xjvf nasm-2.13.02.tar.bz2 && \
	cd nasm-2.13.02 && \
	./autogen.sh && \
	./configure --prefix="/usr/local" && \
	make -j4 && \
	make install && \
	cd /build && \
	rm -R nasm-2.13.02

ADD build /usr/bin/
ADD build-ffmpeg /usr/bin/
ADD build-obs /usr/bin/


CMD ["build"]