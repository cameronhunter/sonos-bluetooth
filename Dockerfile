FROM resin/rpi-raspbian:jessie

MAINTAINER Cameron Hunter <hello@cameronhunter.co.uk>

ENV SONOS_USER sonos

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bluez \
    bluez-utils \
    pulseaudio-module-bluetooth \
    qdbus \
    nano

COPY app                  /app
COPY etc/init.d/*         /etc/init.d/
COPY etc/pulse/*          /etc/pulse/
COPY etc/udev/rules.d/*   /etc/udev/rules.d/

RUN useradd --create-home --groups audio,lp $SONOS_USER; \
    update-rc.d pulseaudio defaults; \
    update-rc.d sonos-bluetooth-agent defaults; \
    update-rc.d sonos-bluetooth-server defaults;

CMD ["/sbin/init"]
