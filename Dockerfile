FROM resin/rpi-raspbian:wheezy
MAINTAINER Cameron Hunter <hello@cameronhunter.co.uk>

RUN echo 'Installing bluetoothradio dependencies'
RUN apt-get update && apt-get -y install bluez pulseaudio-module-bluetooth python-gobject python-gobject-2 bluez-tools qdbus git-core

RUN echo 'Cloning bluetoothradio repository'
RUN git clone https://github.com/myoung34/bluetoothradio.git /root/bluetoothradio

RUN echo 'Installing bluetoothradio'
RUN cp /root/bluetoothradio/bluetooth-server /etc/init.d
RUN chmod 755 /etc/init.d/bluetooth-server && chmod +x /etc/init.d/bluetooth-server
RUN update-rc.d bluetooth-server defaults

RUN echo "bin/bash" > /start
RUN chmod +x /start
