FROM resin/rpi-raspbian:jessie

MAINTAINER Cameron Hunter <hello@cameronhunter.co.uk>

ENV SONOS_USER sonos

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bluez \
    bluez-tools \
    pulseaudio-module-bluetooth \
    nano

COPY app                  /app
COPY etc/pulse/*          /etc/pulse/
COPY etc/systemd/system/* /etc/systemd/system/
COPY etc/udev/rules.d/*   /etc/udev/rules.d/

RUN adduser --system --ingroup pulse --home /var/run/pulse pulse; \
    adduser pulse lp; \
    systemctl enable pulseaudio; \
    systemctl enable bluetooth-setup;

CMD ["/sbin/init"]
