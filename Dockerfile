FROM resin/rpi-raspbian:wheezy

RUN echo 'Updating OS'
RUN apt-get update
RUN apt-get -y upgrade

RUN echo 'Installing bluetoothradio dependencies'
RUN apt-get -y install bluez pulseaudio-module-bluetooth python-gobject python-gobject-2 bluez-tools qdbus git-core

RUN echo 'Cloning bluetoothradio repository'
RUN git clone https://github.com/myoung34/bluetoothradio.git
ADD bluetoothradio /bluetoothradio

RUN echo "echo 'IT WORKS'" > /start
RUN chmod +x /start
