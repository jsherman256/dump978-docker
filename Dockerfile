FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt install -y \
  build-essential \
  debhelper \
  libboost-system-dev \
  libboost-program-options-dev \
  libboost-regex-dev \
  libboost-filesystem-dev \
  libsoapysdr-dev \
  lighttpd \
  git

RUN git clone https://github.com/flightaware/dump978.git /dump978
WORKDIR /dump978
RUN git checkout v7.2
RUN dpkg-buildpackage -b
RUN dpkg -i ../dump978-fa_*.deb ../skyaware978_*.deb