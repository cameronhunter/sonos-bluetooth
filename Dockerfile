FROM resin/rpi-raspbian:wheezy

MAINTAINER Cameron Hunter <hello@cameronhunter.co.uk>

ENV SONOS_USER sonos
ENV BLUETOOTH_NAME Sonos

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bluez \
    bluez-utils \
    pulseaudio-module-bluetooth \
    qdbus

COPY app          /app
COPY etc/init.d/* /etc/init.d/

RUN useradd --system --groups audio,lp $SONOS_USER; \
    update-rc.d pulseaudio defaults; \
    update-rc.d sonos-bluetooth-agent defaults; \
    update-rc.d sonos-bluetooth-server defaults;

CMD ["/sbin/init"]
