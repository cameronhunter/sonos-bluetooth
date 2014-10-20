FROM resin/rpi-raspbian:wheezy
MAINTAINER Cameron Hunter <hello@cameronhunter.co.uk>

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
  bluez \
  bluez-tools \
  pulseaudio-module-bluetooth \
  python-gobject \
  python-gobject-2 \
  qdbus \
  unzip

# Get bluetoothradio
ADD https://github.com/cameronhunter/bluetoothradio/archive/master.zip /root/bluetoothradio-master.zip
RUN unzip /root/bluetoothradio-master.zip -d /root/
RUN mv /root/bluetoothradio-master /root/bluetoothradio

# Installing bluetoothradio
RUN cp /root/bluetoothradio/bluetooth-server /etc/init.d
RUN chmod 755 /etc/init.d/bluetooth-server && chmod +x /etc/init.d/bluetooth-server
RUN update-rc.d bluetooth-server defaults

RUN echo "tail -f /var/log/syslog" > /start
RUN chmod +x /start
