FROM resin/rpi-raspbian:jessie

MAINTAINER Cameron Hunter <hello@cameronhunter.co.uk>

ENV SONOS_USER sonos
ENV BLUETOOTH_NAME Sonos

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bluez \
    pulseaudio-module-bluetooth \
    python-gobject \
    python-gobject-2 \
    qdbus

COPY app                    /app
COPY etc/bluetooth/*        /etc/bluetooth/
COPY etc/systemd/system/*   /etc/systemd/system/

RUN useradd --system --groups audio,lp $SONOS_USER; \
    systemctl enable bluetooth; \
    systemctl enable bluetooth-agent; \
    systemctl enable bluetooth-server; \
    systemctl enable pulseaudio;

CMD ["/sbin/init"]
