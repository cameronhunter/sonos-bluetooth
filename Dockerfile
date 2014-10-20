FROM resin/rpi-raspbian:wheezy
MAINTAINER Cameron Hunter <hello@cameronhunter.co.uk>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
  bluez \
  bluez-tools \
  pulseaudio-module-bluetooth \
  python-gobject \
  python-gobject-2 \
  qdbus

ADD bluetoothradio /root/bluetoothradio

RUN cp /root/bluetoothradio/bluetooth-server /etc/init.d
RUN chmod 755 /etc/init.d/bluetooth-server && chmod +x /etc/init.d/bluetooth-server
RUN update-rc.d bluetooth-server defaults

RUN echo "./root/bluetoothradio/startup.sh" > /start
RUN chmod +x /start
